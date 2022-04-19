#!/bin/sh

VERSION=1.1.7
FOLDER="istio-${VERSION}"
TAR="${FOLDER}-linux.tar.gz"
TAR_SHA256="e349f7f42888bca94318bf93e21c06ffc8fc900818275d24af9450af782aeda4"
url="https://github.com/istio/istio/releases/download/${VERSION}/${TAR}"

wget ${url} \
    && sha256sum ${TAR} | grep -q "${TAR_SHA256}" \
    && tar zxvf ${TAR} \
    && mv "${FOLDER}/bin/istioctl" /usr/local/bin/ \
    && rm -rf "${FOLDER}" "${TAR}"