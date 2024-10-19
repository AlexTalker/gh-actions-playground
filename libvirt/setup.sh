#!/usr/bin/env bash

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "ROOTDIR=${SCRIPTDIR}" > "${SCRIPTDIR}"/.env

mkdir "${SCRIPTDIR}"/vagrant.d
mkdir "${SCRIPTDIR}"/workdir

cp Vagrantfile "${SCRIPTDIR}"/workdir/

cd "${SCRIPTDIR}"

exec podman-compose build