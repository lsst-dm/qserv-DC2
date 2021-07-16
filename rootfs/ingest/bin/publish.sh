#!/bin/sh

# Publish a Qserv database, using Qserv replication system

set -euxo pipefail

usage() {
  cat << EOD

Usage: `basename $0` [options]
  Available options:
    -h          this message

  Launch an ingest process, running sequentially super-transactions,
  stop when no more chunk file remains in chunk queue,
  ingest chunk_queue_size/chunk_queue_fraction chunk files per super-transaction.
  Use \$DATA_URL to access input data.


EOD
}

# get the options
while getopts h c ; do
    case $c in
	    h) usage ; exit 0 ;;
	    \?) usage ; exit 2 ;;
    esac
done
shift `expr $OPTIND - 1`

if [ $# -ne 0 ] ; then
    usage
    exit 2
fi

# Publish database
replctl-publish -v
