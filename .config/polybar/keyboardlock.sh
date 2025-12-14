#!/bin/sh

for led_dir in /sys/class/leds/input*/; do
	input_num=$(basename "$led_dir")
	input_num=${input_num%%:*}
	break
done

while true; do
	sleep 1
	output=""
	capslk=$(cat /sys/class/leds/"$input_num"::capslock/brightness)
	nmlk=$(cat /sys/class/leds/"$input_num"::numlock/brightness)
	scrlk=$(cat /sys/class/leds/"$input_num"::scrolllock/brightness)
	if [ "$capslk" = "1" ]; then
		output="${output}CapsLk "
	fi
	if [ "$nmlk" = "1" ]; then
		output="${output}NmLk "
	fi
	if [ "$scrlk" = "1" ]; then
		output="${output}ScrLk "
	fi
	echo "$output" | sed 's/[[:space:]]*$//'
done
