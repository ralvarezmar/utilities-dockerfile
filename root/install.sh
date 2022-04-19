#!/bin/sh

set -e
set -x

CURR_DIR="$(dirname $0)"
source "${CURR_DIR}/main.sh"
${CURR_DIR}/amazon-linux-extras.sh
${CURR_DIR}/kubectl.sh
${CURR_DIR}/helm.sh
${CURR_DIR}/renderizer.sh 
${CURR_DIR}/yq.sh
${CURR_DIR}/krew.sh
${CURR_DIR}/go.sh
${CURR_DIR}/jsonnet.sh
${CURR_DIR}/istioctl.sh
${CURR_DIR}/aws-iam-authenticator.sh
${CURR_DIR}/jdk8maven.sh
