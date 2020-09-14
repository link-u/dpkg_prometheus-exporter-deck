#! /bin/bash -eux

set -eux

## git リポジトリ上の root のパスを取得
scripts_dir=$(cd $(dirname $(readlink -f $0)) && pwd)
root_dir=$(cd ${scripts_dir} && cd .. && pwd)
cd ${root_dir}

apt install -y ./artifact/*.deb
apt show prometheus-exporter-deck

## node_exporter
which node_exporter
node_exporter -h
ldd $(which node_exporter) || true

## mysqld_exporter
which mysqld_exporter
mysqld_exporter -h
ldd $(which mysqld_exporter) || true

## postgres_exporter
#which postgres_exporter
#postgres_exporter -h
#ldd $(which postgres_exporter) || true

## sql_exporter
which sql_exporter
sql_exporter -h
ldd $(which sql_exporter) || true

## nginx-vts-exporter
which nginx-vts-exporter
nginx-vts-exporter -h
ldd $(which nginx-vts-exporter) || true

## php-fpm_exporter
which php-fpm_exporter
php-fpm_exporter -h
ldd $(which php-fpm_exporter) || true

## redis_exporter
which redis_exporter
redis_exporter -h
ldd $(which redis_exporter) || true
