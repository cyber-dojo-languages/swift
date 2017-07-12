#!/bin/bash

readonly CLANG_VERSION=3.6

apt-get update --no-install-recommends
apt-get install --no-install-recommends --yes wget clang-${CLANG_VERSION} libicu-dev libxml2
update-alternatives --install /usr/bin/clang   clang   /usr/bin/clang-${CLANG_VERSION}   100
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${CLANG_VERSION} 100

readonly SWIFT_VERSION=3.1.1
readonly SWIFT_SNAPSHOT_URL_DIRECTORY=swift-${SWIFT_VERSION}-RELEASE
readonly SWIFT_SNAPSHOT=${SWIFT_SNAPSHOT_URL_DIRECTORY}-ubuntu14.04

wget https://swift.org/builds/swift-${SWIFT_VERSION}-release/ubuntu1404/${SWIFT_SNAPSHOT_URL_DIRECTORY}/${SWIFT_SNAPSHOT}.tar.gz

tar -xvf ${SWIFT_SNAPSHOT}.tar.gz
chmod -R a+r ${SWIFT_SNAPSHOT}/usr
cp -r ${SWIFT_SNAPSHOT}/usr/* /usr/

rm -rf ${SWIFT_SNAPSHOT}
rm -f ${SWIFT_SNAPSHOT}.tar.gz
