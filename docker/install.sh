#!/bin/bash

apt-get update
apt-get install -y wget clang-3.6 libicu-dev libxml2
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

SWIFT_SNAPSHOT_URL_DIRECTORY=swift-3.1.1-RELEASE
SWIFT_SNAPSHOT=${SWIFT_SNAPSHOT_URL_DIRECTORY}-ubuntu14.04

wget https://swift.org/builds/swift-3.1.1-release/ubuntu1404/${SWIFT_SNAPSHOT_URL_DIRECTORY}/${SWIFT_SNAPSHOT}.tar.gz

tar -xvf ${SWIFT_SNAPSHOT}.tar.gz
chmod -R a+r ${SWIFT_SNAPSHOT}/usr
cp -r ${SWIFT_SNAPSHOT}/usr/* /usr/

rm -rf ${SWIFT_SNAPSHOT}
rm -f ${SWIFT_SNAPSHOT}.tar.gz
