#!/bin/sh

# Ask Qserv replication system to register a Qserv database, prior to data ingestion
set -euxo pipefail

# Register database and tables
replctl-register -v
