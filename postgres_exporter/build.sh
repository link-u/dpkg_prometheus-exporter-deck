#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

export CGO_ENABLED=1
go get -u github.com/wrouesnel/postgres_exporter
go run mage.go binary
