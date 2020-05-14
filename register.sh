#!/bin/bash

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$DIR"/env.sh

CZAR_POD="${INSTANCE}-czar-0"
REPL_CTL_POD="${INSTANCE}-repl-ctl-0"

kubectl exec -it "$INGEST_POD" -- register-db.sh

kubectl cp "$REPL_CTL_POD":/qserv/data/qserv/empty_desc_dc2.txt  /tmp/empty_desc_dc2.txt 
kubectl cp /tmp/empty_desc_dc2.txt "$CZAR_POD":/qserv/data/qserv/
