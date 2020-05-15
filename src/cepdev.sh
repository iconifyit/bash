#!/usr/bin/env bash

function getdirname {
  pwd  >/tmp/x
  STR=`cat /tmp/x`
  FN=`awk -F\/ '{print NF}' /tmp/x`
  DIR=$(echo $STR | cut -f$FN -d"/")
  echo $DIR
}

function cepdev {
	HERE=`pwd`
	NAME=`getdirname`

	read -s -p 'Enter Password:' PASSWORD

	extension="/Library/Application Support/Adobe/CEP/extensions/$NAME.dev"

	if [ -d "$extension" ]; then
		read -s -p "Are you sure you want to delete $extension ? (type yes)" CONFIRM
		if [ "$CONFIRM" != "yes" ] && [ "$CONFIRM" != "YES" ]; then
			echo "" && echo "Exiting without doing anything"
			return
		fi
		echo -e "$PASSWORD\n" | sudo rm -R -f "$extension"
		# echo "Faking rm -R -f"
	fi

	echo -e "$PASSWORD\n" | sudo ln -s "$HERE" "/Library/Application Support/Adobe/CEP/extensions/$NAME.dev"
	# echo "Faking install extension"
}
