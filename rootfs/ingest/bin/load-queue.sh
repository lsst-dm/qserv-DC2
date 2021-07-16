#!/bin/sh

# Launch parallel ingest tasks based on Qserv replication system
set -euxo pipefail

load-queue -v
