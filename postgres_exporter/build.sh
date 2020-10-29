#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

apt-get install -y postgresql-client-common

export CGO_ENABLED=1
export GO111MODULE=off
go get github.com/magefile/mage
go run mage.go
go build -o postgres_exporter ./cmd/postgres_exporter
