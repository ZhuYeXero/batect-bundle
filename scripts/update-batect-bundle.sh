#! /usr/bin/env bash

set -euo pipefail

GIT_HASH=$(git ls-remote git@github.com:ZhuYeXero/batect-bundle.git | awk "/master/ {print \$1}")

sed -i -E "s/(\/batect-.+):\w{40}/\1:${GIT_HASH}/g" batect.yml

sed -i -E "/ZhuYeXero\/batect-bundle.git/{n;s/ref:\s*\w{40}/ref: ${GIT_HASH}/g}" batect.yml

echo "Updated batect-bundle version to ${GIT_HASH}"
