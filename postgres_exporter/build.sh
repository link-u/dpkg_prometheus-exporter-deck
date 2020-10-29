#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

apt-get install -y postgresql-client-common

export CGO_ENABLED=1
go mod init
go build -mod=mod -o postgres_exporter ./cmd/postgres_exporter
