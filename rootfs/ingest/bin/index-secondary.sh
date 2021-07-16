#!/bin/sh

# Ask replication system to create secondary index for Qserv data
set -euxo pipefail

# Publish database
replctl-index -s -v
