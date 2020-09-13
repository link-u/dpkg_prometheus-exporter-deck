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
