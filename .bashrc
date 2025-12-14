# set editor
export EDITOR=vim

# add local paths
export PATH="$PATH:$HOME/.local/userscripts/bin:$HOME/.local/bin"

# sort dotfiles first
export LC_ALL="C"

# set 256 colors
export TERM=xterm-256color

# add color for broken symlink
export LS_COLORS="$LS_COLORS:or=31;01:mi=31;01"
# change symlink color to purple
export LS_COLORS="$LS_COLORS:ln=35;01"

# suppress output for non-interactive sessions (needed for scp/rsync)
if [[ ! "$-" =~ i ]]; then
	return
fi

# set tab length to 4
tabs 4

# -----------
# PROMPT
# -----------
# begin prompt
PS1="\[\e[36m\][\[\e[37m\]\h\[\e[36m\]] "
# display if root or sudo
if [[ "$EUID" -eq 0 ]]; then
	if [[ "$HOME" == '/root' ]]; then
		PS1+="(root) "
	else
		PS1+="(sudo) "
	fi
fi
# display if ssh connection
if [[ -n "$SSH_CONNECTION" ]]; then
	PS1+="(ssh) "
fi
# finish prompt
PS1+="\w \[\e[0m\]>"


# -----------
# ALIAS
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
# enable color support for ls and grep
alias ls='ls --color=auto --group-directories-first -A'
alias grep='grep --color=always'
# making cp and mv ask before overwriting files as user and sudo
alias sudo='sudo '
alias cp='cp -i'
alias mv='mv -i'
