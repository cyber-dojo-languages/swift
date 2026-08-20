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

# swift.org publishes one tarball per architecture, carrying the architecture in
# both the directory and the filename. Selecting on the build machine's own
# architecture is what keeps an x86-64 toolchain out of an arm64 image, where
# every swift binary traps on a loader the image does not have.
case "$(uname --machine)" in
  x86_64)  SWIFT_ARCH_SUFFIX='' ;;
  aarch64) SWIFT_ARCH_SUFFIX='-aarch64' ;;
  *)       echo "no swift.org tarball for $(uname --machine)" >&2; exit 1 ;;
esac

SWIFT_SNAPSHOT_URL_DIRECTORY=swift-${SWIFT_VERSION}-RELEASE
SWIFT_SNAPSHOT=${SWIFT_SNAPSHOT_URL_DIRECTORY}-ubuntu${SWIFT_OS_MAJOR}.${SWIFT_OS_MINOR}${SWIFT_ARCH_SUFFIX}
SWIFT_URL=https://swift.org/builds/swift-${SWIFT_VERSION}-release/ubuntu${SWIFT_OS_MAJOR}${SWIFT_OS_MINOR}${SWIFT_ARCH_SUFFIX}/${SWIFT_SNAPSHOT_URL_DIRECTORY}/${SWIFT_SNAPSHOT}.tar.gz

apt-get install --yes wget

wget ${SWIFT_URL}
tar xzf ${SWIFT_SNAPSHOT}.tar.gz
rm ${SWIFT_SNAPSHOT}.tar.gz
# The extracted directory is named after the architecture, so it is renamed to
# one the image's PATH can state without repeating the version and OS.
mv ${SWIFT_SNAPSHOT} /swift

apt-get remove --yes wget
