#!/bin/bash

if ! [ -z "${ADMIN_PASSWORD}" ]; then
  echo "lpadmin:${ADMIN_PASSWORD}" | chpasswd
fi

if ! [ -z "${ADDITIONAL_USER}" ]; then
  user=$(echo ${ADDITIONAL_USER}|cut -d: -f1)
  pwd=$(echo ${ADDITIONAL_USER}|cut -d: -f2)
  adduser ${user}
  echo "${user}:${pwd}" | chpasswd
fi

if ! [ -z "${LOG_LEVEL}" ]; then
  sed -i "s/LogLevel warn/LogLevel ${LOG_LEVEL}/" /etc/cups/cupsd.conf
fi

if ! [ -z "${SERVER_NAME}" ]; then
  sed -i "s/#ServerName name/ServerName ${SERVER_NAME}/" /etc/cups/cupsd.conf
fi
