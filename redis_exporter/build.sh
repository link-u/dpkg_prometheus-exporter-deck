#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd redis_exporter

go build \
  --ldflags '-linkmode external -extldflags "-static"' \
  -o redis_exporter .
