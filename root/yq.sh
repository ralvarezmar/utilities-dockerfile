#!/bin/sh

# yq
curl -L -o yq "https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64" && \
    chmod +x /yq && \
    mv /yq /usr/local/bin/