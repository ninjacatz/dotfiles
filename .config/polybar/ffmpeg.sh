#!/bin/sh

output=""

if pgrep -x ffmpeg > /dev/null; then
	output="${output}ffmpeg"
fi

echo "$output"
