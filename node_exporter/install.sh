#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}

install -D -m 755 ./node_exporter/node_exporter ../debian/tmp/usr/bin
