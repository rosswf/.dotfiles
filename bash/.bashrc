# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi



unset rc

PS1='\[\e[0;94m\]\u \[\e[0;96m\]\w \[\033[38;5;5m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2 | sed "s/^/ /g") \n\[\e[0;1;94m\] \[\e[0m\]'

alias py="python3"
alias ncspot="flatpak --filesystem=/home/ross/.dotfiles/ncspot/ run io.github.hrkfdn.ncspot"
