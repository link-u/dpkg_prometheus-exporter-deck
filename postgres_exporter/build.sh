#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

export CGO_ENABLED=1
go mod vendor
go run mage.go binary
