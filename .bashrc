export EDITOR=vim

export PATH="$PATH:$HOME/.local/userscripts/bin:$HOME/.local/bin"

# for 256 colors
export TERM=xterm-256color

# suppress output for non-interactive sessions (needed for scp/rsync)
if [[ ! "$-" =~ i ]]; then
	return
fi

# -----------
# Prompt
# -----------
# Adds title
PS1="\[\033]0;\w - Bash\007\]"
# Begin prompt
PS1+="\[\e[36m\][\[\e[37m\]\h\[\e[36m\]] "
if [[ "$EUID" -eq 0 ]]; then
	if [[ "$HOME" == '/root' ]]; then
		PS1+="(root) "
	else
		PS1+="(sudo) "
	fi
fi
if [[ -n "$SSH_CONNECTION" ]]; then
	PS1+="(ssh) "
fi
PS1+="\w \[\e[0m\]>"

# Set tab length to 4
tabs 4

# -----------
# Alias
# -----------
# sudo vim --> sudo -E vim
# sudo vifm --> sudo -E vifm
sudo() {
	if [ "$1" = "vim" ]; then
		command sudo -E "$@"
	elif [ "$1" = "vifm" ]; then
		command sudo -E "$@"
	else
		command sudo "$@"
	fi
}
# enable color support of commands
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=always'
# making cp and mv ask before overwriting files as user and sudo
alias sudo='sudo '
alias cp='cp -i'
alias mv='mv -i'
