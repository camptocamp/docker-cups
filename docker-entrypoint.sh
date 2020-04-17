#!/bin/bash

DIR=/docker-entrypoint.d

if [[ -d "$DIR" ]]
then
  cp /run/secrets/*.sh "$DIR"
  /bin/run-parts "$DIR"
fi

exec "$@"
