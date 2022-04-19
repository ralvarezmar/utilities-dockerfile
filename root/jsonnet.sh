#!/bin/sh

JSONNET_VERSION="v0.16.0"
JSONNET_FILE="jsonnet-bin-${JSONNET_VERSION}-linux.tar.gz"

curl -LO "https://github.com/google/jsonnet/releases/download/${JSONNET_VERSION}/${JSONNET_FILE}" \
    && mkdir -p jsonnet \
    && tar zxvf ${JSONNET_FILE} -C jsonnet && mv jsonnet/* /usr/local/bin/ \
    && rm ${JSONNET_FILE} && rm -rf jsonnet