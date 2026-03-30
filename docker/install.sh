#!/bin/bash -Eeu

# https://www.swift.org/install/linux/tarball/

apt-get update
apt-get install --yes \
          binutils \
          git \
          gnupg2 \
          libc6-dev \
          libcurl4-openssl-dev \
          libedit2 \
          libgcc-13-dev \
          libncurses-dev \
          libpython3-dev \
          libsqlite3-0 \
          libstdc++-13-dev \
          libxml2-dev \
          libz3-dev \
          pkg-config \
          tzdata \
          zip \
          unzip \
          zlib1g-dev

SWIFT_SNAPSHOT_URL_DIRECTORY=swift-${SWIFT_VERSION}-RELEASE
SWIFT_SNAPSHOT=${SWIFT_SNAPSHOT_URL_DIRECTORY}-ubuntu${SWIFT_OS_MAJOR}.${SWIFT_OS_MINOR}
SWIFT_URL=https://swift.org/builds/swift-${SWIFT_VERSION}-release/ubuntu${SWIFT_OS_MAJOR}${SWIFT_OS_MINOR}/${SWIFT_SNAPSHOT_URL_DIRECTORY}/${SWIFT_SNAPSHOT}.tar.gz

apt-get install --yes wget

wget ${SWIFT_URL}
tar xzf ${SWIFT_SNAPSHOT}.tar.gz
rm ${SWIFT_SNAPSHOT}.tar.gz

apt-get remove --yes wget
