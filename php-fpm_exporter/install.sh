#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}

install -D -m 755 ./php-fpm_exporter/php-fpm_exporter ../prometheus-exporter-deck/debian/tmp/usr/bin
