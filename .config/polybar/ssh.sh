#!/bin/sh

if pgrep -x sshd > /dev/null; then
	output="ssh"
fi

echo "$output"
