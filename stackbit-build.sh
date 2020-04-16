#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e988d4f719200001a0f7f05/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e988d4f719200001a0f7f05
curl -s -X POST https://api.stackbit.com/project/5e988d4f719200001a0f7f05/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e988d4f719200001a0f7f05/webhook/build/publish > /dev/null
