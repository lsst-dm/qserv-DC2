#!/bin/sh

# Ask replication system to create tables indexes for Qserv data
set -euxo pipefail

# Publish database
replctl-index -v
