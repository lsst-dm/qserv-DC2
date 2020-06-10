#!/bin/bash

# POC for loading DC2 data inside Qserv
# Based on https://confluence.lsstcorp.org/display/DM/Live+demo%3A+test+ingest+of+a+subset+of+one+track+of+the+HSC+Object+catalog

# Load python-3
DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$DIR"/env.sh

set -euxo pipefail

# Register database and table
replctl-register -v "$REPL_URL" "$DATA_URL"