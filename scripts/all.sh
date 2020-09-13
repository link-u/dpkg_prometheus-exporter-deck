#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd ..

bash scripts/create_changelog.sh

# install dependencies
mk-build-deps --install --remove \
  --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' \
  debian/control

apt install -y ca-certificates curl

# Install the latest golang manually
# https://github.com/canha/golang-tools-install-script
curl --location --insecure https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
set +eux
source /root/.bashrc
set -eux

bash --login scripts/build.sh
