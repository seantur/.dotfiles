# User PATH definition
export PATH="$PATH:$HOME/.local/bin:/opt/bin"

export TERM="xterm-256color"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration
#
# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'
export KEYTIMEOUT=1

# enable autosuggest
bindkey '       ' autosuggest-accept

# make zsh behave a little more like bash (ctrl-r, ctrl-A, ctrl-K)
bindkey -e
# enable ctrl right/left arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Enable up/down arrow to search based on what's been typed
# https://superuser.com/a/585004
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


setopt nocorrectall;
setopt correct
setopt prompt_subst
setopt auto_cd

source $HOME/.aliases
source $HOME/.zsh_functions

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

# Stolen from: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/gentoo.zsh-theme
# Inlined to prevent the need of oh-my-zsh
autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '%F{5}(%F{2}%b%F{3}|%F{1}%a%c%u%m%F{5})%f '
zstyle ':vcs_info:*' formats '%F{5}(%F{2}%b%c%u%m%F{5})%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:git*+set-message:*' hooks untracked-git

+vi-untracked-git() {
  if command git status --porcelain 2>/dev/null | command grep -q '??'; then
    hook_com[misc]='%F{red}?'
  else
    hook_com[misc]=''
  fi
}

gentoo_precmd() {
  vcs_info
}

autoload -U add-zsh-hook
add-zsh-hook precmd gentoo_precmd

PROMPT='%(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) ${vcs_info_msg_0_}%F{blue}%(!.#.$)%k%b%f '

stty -ixon
autoload -U +X bashcompinit && bashcompinit
