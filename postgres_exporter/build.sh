#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

go get -u -d go get github.com/wrouesnel/postgres_exporter
rm -Rf "${GOPATH}/src/github.com/wrouesnel/postgres_exporter"
cp postgres_exporter "${GOPATH}/src/github.com/wrouesnel/postgres_exporter"
pushd
cd "${GOPATH}/src/github.com/wrouesnel/postgres_exporter"
go get .
go run mage.go binary
popd

cp -vf "${GOPATH}/src/github.com/wrouesnel/postgres_exporter/postgres_exporter" .
