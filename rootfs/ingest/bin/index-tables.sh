#!/bin/sh

# Ask replication system to create tables indexes for Qserv data

DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$DIR"/env.sh

set -euxo pipefail

# Publish database
replctl-index -v "$DATA_URL" "$REPL_URL"
