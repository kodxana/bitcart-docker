#!/usr/bin/env bash

. helpers.sh
get_profile_file "$SCRIPTS_POSTFIX" false

. ${BASH_PROFILE_SCRIPT}

cd "$BITCART_BASE_DIRECTORY"
# stop listener
kill $(cat listener.pid) &> /dev/null || true
USER_UID=${UID} USER_GID=${GID} docker-compose -p "$NAME" -f compose/generated.yml down