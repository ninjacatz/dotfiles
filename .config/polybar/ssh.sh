#!/bin/sh

output=""

if pgrep -x sshd > /dev/null; then
	output="${output}ssh"
fi

echo "$output"
