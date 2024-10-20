#!/usr/bin/env bash

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd "${SCRIPTDIR}"

# Steal original UID/GID
export PODMAN_USERNS=keep-id

exec podman-compose run --rm --entrypoint /bin/bash vagrant "$@"