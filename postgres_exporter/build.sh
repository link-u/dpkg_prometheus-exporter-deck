#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

pushd
cd "${GOPATH}/src/github.com/wrouesnel/postgres_exporter"
go run mage.go binary
popd

cp -vf "${GOPATH}/src/github.com/wrouesnel/postgres_exporter/postgres_exporter" .
