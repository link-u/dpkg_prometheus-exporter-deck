#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}

env --chdir=${SCRIPT_PATH}/nginx-vts-exporter go mod download
env --chdir=${SCRIPT_PATH}/nginx-vts-exporter make all
