export EDITOR=vim

export PATH="$PATH:$HOME/.local/bin/scripts"

# -----------
# Prompt
# -----------
# Adds title
PS1="\[\033]0;\w - Bash\007\]"
PS1+="\[\e[36m\]"
if [[ $EUID -eq 0 ]]; then
	if [[ $HOME == '/root' ]]; then
		PS1+="(root) "
	else
		PS1+="(sudo) "
	fi
fi
if [[ -n "$SSH_CONNECTION" ]]; then
	PS1+="(ssh) "
fi
PS1+="\w \[\e[0m\]>"

# -----------
# Alias and Safety checks
# -----------
# enable color support of commands
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=always'
# rm and sudo rm
rm() {
	echo "rm disabled. Use trash"
}
rmdir() {
	echo "rmdir disabled. Use trash"
}
sudo() {
	if [[ $1 == "rm" ]]; then
		echo "sudo rm disabled. Use sudo trash"
	elif [[ $1 == "rmdir" ]]; then
		echo "sudo rmdir disabled. Use sudo trash"
	else
		command sudo "$@"
	fi
}
# chown with recursion
chown() {
	local disable=false
	for arg in "$@"; do
		if [[ $arg == "-R" || $arg == "--recursive" ]]; then
			disable=true
			break
		fi
	done
	if $disable; then
		echo "chown recursion disabled. Use sudo chown"
	else
		command chown "$@"
	fi
}
# chgrp with recursion
chgrp() {
	local disable=false
	for arg in "$@"; do
		if [[ $arg == "-R" || $arg == "--recursive" ]]; then
			disable=true
			break
		fi
	done
	if $disable; then
		echo "chgrp recursion disabled. Use sudo chgrp"
	else
		command chgrp "$@"
	fi
}
# chmod with recursion
chmod() {
	local disable=false
	for arg in "$@"; do
		if [[ $arg == "-R" || $arg == "--recursive" ]]; then
			disable=true
			break
		fi
	done
	if $disable; then
		echo "chmod recursion disabled. Use sudo chmod"
	else
		command chmod "$@"
	fi
}
# making cp and mv ask before overwriting files as user and sudo
alias sudo='sudo '
alias cp='cp -i'
alias mv='mv -i'




