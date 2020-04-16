#!/bin/bash

set -e

if [ "$1" = 'cupsd' ]; then

  if ! [ -z "${ADMIN_PASSWORD}" ]; then
    echo "lpadmin:${ADMIN_PASSWORD}" | chpasswd
  fi
  if ! [ -z "${LOG_LEVEL}" ]; then
    sed -i "s/LogLevel warn/LogLevel ${LOG_LEVEL}/" /etc/cups/cupsd.conf
  fi

fi

exec "$@"
