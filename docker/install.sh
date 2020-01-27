#!/bin/bash -Eeu

# https://swift.org/download/#releases
apt-get install --yes clang libicu-dev

SWIFT_SNAPSHOT_URL_DIRECTORY=swift-${SWIFT_VERSION}-RELEASE
SWIFT_SNAPSHOT=${SWIFT_SNAPSHOT_URL_DIRECTORY}-ubuntu${SWIFT_OS_MAJOR}.${SWIFT_OS_MINOR}
SWIFT_URL=https://swift.org/builds/swift-${SWIFT_VERSION}-release/ubuntu${SWIFT_OS_MAJOR}${SWIFT_OS_MINOR}/${SWIFT_SNAPSHOT_URL_DIRECTORY}/${SWIFT_SNAPSHOT}.tar.gz

apt-get install --yes wget

wget ${SWIFT_URL}
tar xzf ${SWIFT_SNAPSHOT}.tar.gz
rm ${SWIFT_SNAPSHOT}.tar.gz

apt-get remove --yes wget
