#! /bin/bash -eux

set -eux

function shouldBeSingleBinary() {
  local path
  path="$(command -v "$1")"
  if ldd "${path}" 2> /dev/null; then
    echo "NG: ${path} is not fully statically linked."
    exit -1
  else
    echo "OK: ${path} is statically linked."
  fi
}

## git リポジトリ上の root のパスを取得
scripts_dir="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
root_dir="$(cd "${scripts_dir}" && cd .. && pwd)"
cd "${root_dir}"

echo "::group::Directory structure"
find . 
echo "::endgroup::"

echo "::group::Testing binaries"
dpkg-deb --contents ./artifact/*.deb

apt install -y ./artifact/*.deb
apt show prometheus-exporter-deck

## node_exporter
command -v node_exporter
node_exporter -h
shouldBeSingleBinary "node_exporter"

## mysqld_exporter
command -v mysqld_exporter
mysqld_exporter -h
shouldBeSingleBinary "mysqld_exporter"

## postgres_exporter
command -v postgres_exporter
postgres_exporter -h
shouldBeSingleBinary "postgres_exporter"

## sql_exporter
command -v sql_exporter
sql_exporter -h
shouldBeSingleBinary "sql_exporter"

## nginx-vts-exporter
command -v nginx-vts-exporter
nginx-vts-exporter -h
shouldBeSingleBinary "nginx-vts-exporter"

## php-fpm_exporter
command -v php-fpm_exporter
php-fpm_exporter -h
shouldBeSingleBinary "php-fpm_exporter"

## redis_exporter
command -v redis_exporter
redis_exporter -h
shouldBeSingleBinary "redis_exporter"

## memcached_exporter
command -v memcached_exporter
memcached_exporter -h
shouldBeSingleBinary "memcached_exporter"
echo "::endgroup::"
