#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}

env --chdir=${SCRIPT_PATH}/mysqld_exporter go mod download
env --chdir=${SCRIPT_PATH}/mysqld_exporter make check_license style staticcheck unused build test-short
