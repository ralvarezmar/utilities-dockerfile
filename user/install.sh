#!/bin/sh

set -e

CURR_DIR="$(dirname $0)"

source /etc/profile

${CURR_DIR}/krew.sh
${CURR_DIR}/jb.sh
${CURR_DIR}/nvm.sh