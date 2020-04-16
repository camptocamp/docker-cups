#!/bin/bash

set -e

if [ "$1" = 'cupsd' ]; then

  if ! [ -z "${LOG_LEVEL}" ]; then
    sed -i "s/LogLevel warn/LogLevel ${LOG_LEVEL}/" /etc/cups/cupsd.conf
  fi

fi

exec "$@"
