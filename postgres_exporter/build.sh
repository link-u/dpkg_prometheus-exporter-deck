#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

apt-get install -y postgresql-client-common
go build -o postgres_exporter ./cmd/postgres_exporter
