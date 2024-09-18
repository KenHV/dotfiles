export EDITOR=vim
export VISUAL=vim

export GPG_TTY=$(tty)
export PATH="$PATH:~/.local/bin"

# Better tab autocomplete
bind TAB:menu-complete
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "set colored-completion-prefix on"
bind "set colored-stats on"
