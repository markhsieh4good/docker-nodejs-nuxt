#!/bin/sh
set -e

## set default wait service exec. is node, if you not enter any command.
#if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
#  set -- node "$@"
#fi

exec "$@"
