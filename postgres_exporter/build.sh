#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

export CGO_ENABLED=1
export GO111MODULE=off
apt-get install -y postgresql-client-common
go get github.com/mholt/archiver
go get github.com/magefile/mage/mage
go run mage.go binary
