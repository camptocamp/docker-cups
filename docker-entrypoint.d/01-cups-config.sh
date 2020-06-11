#!/bin/bash

if ! [ -z "${ADMIN_PASSWORD}" ]; then
  echo "lpadmin:${ADMIN_PASSWORD}" | chpasswd
fi

if ! [ -z "${ADDITIONAL_USER}" ]; then
  user=$(echo ${ADDITIONAL_USER}|cut -d: -f1)
  adduser ${user}
  pwd=$(echo ${ADDITIONAL_USER}|cut -d: -f2)
  echo "${user}:${pwd}" | chpasswd
fi

if ! [ -z "${LOG_LEVEL}" ]; then
  sed -i "s/LogLevel warn/LogLevel ${LOG_LEVEL}/" /etc/cups/cupsd.conf
fi
