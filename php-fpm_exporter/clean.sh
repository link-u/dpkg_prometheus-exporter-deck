#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd php-fpm_exporter

go clean ./...
