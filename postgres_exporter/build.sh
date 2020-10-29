#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_PATH}
cd postgres_exporter

export CGO_ENABLED=1
apt-get install -y postgresql-client-common
./gh-assets-clone.sh
go run mage.go -v all
