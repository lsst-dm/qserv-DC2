#!/usr/bin/env bash

# Publish a qserv-ingest release

# @author  Fabrice Jammes, IN2P3, fabrice.jammes@clermont.in2p3.fr

set -euo pipefail

OP_VERSION=""
releasetag=""

DIR=$(cd "$(dirname "$0")"; pwd -P)

set -e

usage() {
  cat << EOD

Usage: `basename $0` [options]

  Available options:
    -h          this message
    -t          release-tag: create a git release tag and use it to tag qserv-ingest image

- Push qserv-ingest image to docker hub
EOD
}

# get the options
while getopts ht: c ; do
    case $c in
	    h) usage ; exit 0 ;;
      t) releasetag="$OPTARG" ;;
	    \?) usage ; exit 2 ;;
    esac
done
shift `expr $OPTIND - 1`

if [ -n "$releasetag" ] ; then
    export OP_VERSION="$releasetag"
fi

. "$DIR/env.build.sh"

if [ $# -ne 0 ] ; then
    usage
    exit 2
fi

sed -i "s/^INGEST_RELEASE=.*$/INGEST_RELEASE='$releasetag'/" env.example.sh
echo "-- Run command below to publish the release:"
echo "git add . &&  git commit -m "Release $releasetag" && git tag -a "$releasetag" -m "Version $releasetag" && git push --tag"
echo "-- Then rebuild and push Qserv image using the new release tag:"
echo "./build.sh"
echo "./push-image.sh"
