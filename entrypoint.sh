#!/bin/sh

# ./entrypoint.sh https://...

# set -e
# set -x

if [ -n "${1}" ]; then

    url_artifact=${1}
    echo -e "\e[32mDownloading STACK scripts ${url_artifact}\e[0m"

    #	----------------------------------------------------------------
    # 	download scripts from artifactory
    #	----------------------------------------------------------------
    curl -s ${url_artifact} --output scripts.tar.gz && \
        mkdir -p scripts && \
        tar -xvf scripts.tar.gz -C scripts && \
        rm scripts.tar.gz && \
        chmod +x scripts/deploy/*.sh
fi

exec /usr/bin/zsh