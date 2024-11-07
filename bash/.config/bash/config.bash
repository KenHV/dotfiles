export EDITOR=vim
export VISUAL=vim

export GPG_TTY=$(tty)
export PATH="$PATH:~/.local/bin"

export DEBFULLNAME="Ken Harris"
export DEBEMAIL="vkenharris@gmail.com"

export WINEDEBUG=-all

# Aliases
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"

alias svim="sudo -E vim"

alias ss="~/.smoked-salmon/.venv/bin/python3 ~/.smoked-salmon/run.py"

alias qaac='wine ~/.wine32/drive_c/qaac/qaac.exe'
alias refalac='wine ~/.wine32/drive_c/qaac/refalac.exe'

# Functions

flac_qaac() {
    mkdir -p ./aac
    for i in *flac; do
        qaac --tvbr 91 -o "./aac/${i%flac}m4a" "$i"
    done
}

# Better tab autocomplete
bind TAB:menu-complete
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "set colored-completion-prefix on"
bind "set colored-stats on"

#source ~/.config/bash/env.bash
