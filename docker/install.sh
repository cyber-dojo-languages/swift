#!/bin/sh -eu

# Records the Swift this image holds, in the shape every image shares. The
# installed compiler is asked, so the version is one the image can run rather
# than one written down when someone last edited this file. The first line of
# swiftc --version reads "Swift version 6.3.3 (swift-6.3.3-RELEASE)".
readonly LANGUAGE_VERSION=$(swiftc --version 2>&1 | head -1 | cut -d' ' -f3)

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo 'Could not read a version from swiftc --version' >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "Swift",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF
