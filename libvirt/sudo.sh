#!/usr/bin/env bash

USER_NAME="$(id -un)"
PRIMARY_GROUP_NAME="$(id -gn)"
# Default for Ubuntu
LIBVIRT_GROUP="${LIBVIRT_GROUP:-libvirt}"

# newgrp and sg require password
# but since we're already blessed with sudo
# we can promote the added group as primary
# and then return back the original one

# This can take 12 args from argc maximum, not that anyone will hit it =)

exec sudo --preserve-env --group "${LIBVIRT_GROUP}" --user "${USER_NAME}" \
     sudo --preserve-env --group "${PRIMARY_GROUP_NAME}" --user "${USER_NAME}" \
     "$@"