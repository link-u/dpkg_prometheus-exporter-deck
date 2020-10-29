#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

export CGO_ENABLED=1
unset GO111MODULE
apt-get install -y postgresql-client-common
go get github.com/wrouesnel/postgres_exporter/cmd/postgres_exporter
go get github.com/magefile/mage/mage
go run mage.go binary
