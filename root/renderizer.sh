#!/bin/sh

# renderizer
RENDERIZER_FILENAME=renderizer_linux_x86_64.tar.gz
RENDERIZER_VERSION=2.0.9
mkdir renderizer
curl -LO "https://github.com/gomatic/renderizer/releases/download/${RENDERIZER_VERSION}/${RENDERIZER_FILENAME}" && \
    tar zxvf ${RENDERIZER_FILENAME} -C renderizer && mv /renderizer/renderizer /usr/local/bin/ && \
    rm ${RENDERIZER_FILENAME} && rm -r /renderizer
