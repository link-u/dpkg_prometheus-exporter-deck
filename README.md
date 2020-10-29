# prometheus-exporter-deck

The strongest deck of prometheus exporters!

[![Build debian packages](https://github.com/link-u/dpkg_prometheus-exporter-deck/workflows/Build%20debian%20packages/badge.svg)](https://github.com/link-u/dpkg_prometheus-exporter-deck/actions?query=workflow%3A%22Build+debian+packages%22)

We install exporters to our servers via debian package built by this project.

## Current exporters

 - Meta
   - cradle_exporter
 - Physical
   - node_expoter
 - RDBMS
   - mysqld_exporter
   - postgres_exporter
   - sql_exporter
 - NoSQL
   - redis_expoter
   - memcached_expoters
 - Web Servers
   - nginx-vts-exporter
   - php-fpm_expoter

## How to use?

Please use our debian package repository.

## How to build debian package?

```bash
bash all.sh
ls ../*.deb
```

# Other exporters?

## High Priority

 - [povilasv/systemd_exporter: Exporter for systemd unit metrics](https://github.com/povilasv/systemd_exporter)
 - [carlpett/zookeeper_exporter: Prometheus exporter for Zookeeper](https://github.com/carlpett/zookeeper_exporter)

## Low Priority

 - [gree-gorey/bash-exporter: Simple & minimalistic Prometheus exporter for bash scripts, written in Go](https://github.com/gree-gorey/bash-exporter)
 - [ricoberger/script_exporter: Prometheus exporter to execute scripts and collect metrics from the output or the exit status.](https://github.com/ricoberger/script_exporter)