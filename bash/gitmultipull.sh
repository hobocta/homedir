#!/bin/bash

key="$1"
filename=".hobocta.git.pull.on"
action_path="~/bash/gitmultipull_action.sh"

if [ "$key" = "--all" ] || [ "$key" = "-a" ]; then
	find -mindepth 2 -maxdepth 2 -type d -name '.git' -exec sh -c "$action_path"' "{}" && touch $(dirname "{}")/$(basename "{}")' \;
elif [ "$key" = "--force" ] || [ "$key" = "-f" ]; then
	find -mindepth 2 -maxdepth 2 -type f -name $filename -exec sh -c "$action_path"' "{}" && touch $(dirname "{}")/$(basename "{}")' \;
else
	find -mindepth 2 -maxdepth 2 -type f -name $filename -mmin +720 -exec sh -c "$action_path"' "{}" && touch $(dirname "{}")/$(basename "{}")' \;
fi
