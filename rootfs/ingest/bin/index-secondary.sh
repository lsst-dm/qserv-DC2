#!/bin/sh

# Ask replication system to create secondary index for Qserv data
set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$DIR"/env.sh

data_url="$DATA_URL"

# Publish database
replctl-index -s -v "$data_url" "$REPL_URL"