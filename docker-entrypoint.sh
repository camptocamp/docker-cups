#!/bin/bash

DIR=/docker-entrypoint.d

if [[ -d "$DIR" ]]
then
  if [[ -d "/run/secrets/" ]] ; then
    cp /run/secrets/*sh "$DIR"
  fi
  /bin/run-parts -v "$DIR"
fi

exec "$@"
