#!/usr/bin/env bash
set -e
set -o pipefail

sh /auth.sh

## Kops environments
export CLUSTER_NAME=$CLUSTER_NAME
export KOPS_STATE_STORE=$KOPS_STATE_STORE

echo "👉 Executed command $@ <<<"

bash -c "set -e;  set -o pipefail; $@"
