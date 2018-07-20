#!/bin/sh

if [ -n "$ACTION_CONFIG" ]; then

   echo "$ACTION_CONFIG" > /config/action_file.yml

fi

echo $@

exec "$@"
