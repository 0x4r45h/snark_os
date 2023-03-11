#!/bin/bash

set -e

if [ "$1" = 'prover' ]; then
#  source /usr/src/snarkOS/run-prover.sh
  snarkos start --nodisplay --prover "${PROVER_PRIVATE_KEY}"
elif [ "$1" = 'client' ]; then
  source /usr/src/snarkOS/run-client.sh
else
  exec "$@"
fi