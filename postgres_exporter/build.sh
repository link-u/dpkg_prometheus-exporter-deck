#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

go get -u -d github.com/wrouesnel/postgres_exporter
go run mage.go binary