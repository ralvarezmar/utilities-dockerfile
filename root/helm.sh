#!/bin/sh

# HELM 3 -------------------------------------------------------------------------------
HELM_VERSION=v3.2.1
HELM_LOCATION="https://get.helm.sh"
HELM_FILENAME="helm-${HELM_VERSION}-linux-amd64.tar.gz"
HELM_SHA256="018f9908cb950701a5d59e757653a790c66d8eda288625dbb185354ca6f41f6b"
wget ${HELM_LOCATION}/${HELM_FILENAME} && \
    echo Verifying ${HELM_FILENAME}... && \
    sha256sum ${HELM_FILENAME} | grep -q "${HELM_SHA256}" && \
    echo Extracting ${HELM_FILENAME}... && \
    tar zxvf ${HELM_FILENAME} && \
    mkdir -p /usr/local/bin/helm-binaries/${HELM_VERSION} && \
    mv /linux-amd64/helm /usr/local/bin/helm-binaries/${HELM_VERSION}/ && \
    rm ${HELM_FILENAME} && rm -r /linux-amd64

echo "export MYBASTION_HELM3_VERSION=${HELM_VERSION}" >> /etc/profile.d/env_helm.sh

ln -s /usr/local/bin/helm-binaries/${HELM_VERSION}/helm /usr/local/bin/helm

helm plugin install https://github.com/databus23/helm-diff && \
    helm plugin install https://github.com/futuresimple/helm-secrets

rm -rf /usr/local/bin/helm

# helm for non-root user
cp -R /root/.local /home/$USERNAME
cp -R /root/.cache /home/$USERNAME
find /home/$USERNAME/.local/share/helm -type l -lname '/root/.cache/helm/*' -printf 'ln -nsf "$(readlink "%p" | sed "s;/root/.cache/helm;/home/$USERNAME/.cache/helm;g")" "%p"\n' | source /dev/stdin
chown -R $USER_UID:$USER_GID /home/$USERNAME/.local
chown -R $USER_UID:$USER_GID /home/$USERNAME/.cache
