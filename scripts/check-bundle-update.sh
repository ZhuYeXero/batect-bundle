#! /usr/bin/env bash

set -euo pipefail

GIT_HASH=$(git ls-remote git@github.com:ZhuYeXero/batect-bundle.git | awk "/master/ {print \$1}")

LOCAL_HASH=$(sed -En "/ZhuYeXero\/batect-bundle.git/{n;s/.*ref:\s*(\w{40})/\1/p}" batect.yml)

if [[ "${LOCAL_HASH}" != "${GIT_HASH}" ]]; then
  echo -e "\033[5mThe current batect-bundle version is out of date!\033[m\nUse './batect updateBatectBundle' to update to latest version."
fi
