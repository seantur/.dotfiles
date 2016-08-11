alias ls='ls -h --color --group-directories-first'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -C'
alias sl='ls'
alias s='ls'

alias c='cd;clear'
alias cler='clear'
alias clera='clear'
alias claer='clear'

# Add an "alert" alias for long running commands.  Use like so:   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

