#!/bin/bash

notify () {
	notify-send -t 1000 "ETHER!" "$1"
	paplay /usr/share/sounds/ubuntu/stereo/message.ogg
}

maxToday=0
minToday=99999

while true
do
	price=$(php ./getPrice.php)

	# Le saco el caracter '$'
	price="${price:1}"

	if (( $(echo "$price > $maxToday" | bc -l) ))
	then
		maxToday=$price
		notify "New heighest price for today: \$${price}"
	fi

	if (( $(echo "$price < $minToday" | bc -l) ))
	then
		minToday=$price
		notify "New lowest price for today: \$${price}"
	fi

	sleep 180
done
