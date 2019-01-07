# User PATH definition
export PATH="$PATH:$HOME/.local/bin:/opt/bin"

#Path to your oh-my-zsh installation.
if [ -d "/usr/share/oh-my-zsh" ]; then
    export ZSH=/usr/share/oh-my-zsh
else
    export ZSH=$HOME"/.oh-my-zsh"
fi

export TERM="xterm-256color"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gentoo"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'
export KEYTIMEOUT=1

setopt nocorrectall;
setopt correct

# Wal Colors
(cat ~/.cache/wal/sequences &)

# Source local ZSH configs in .zsh.local
source ~/.zshrc.local

stty -ixon
autoload -U +X bashcompinit && bashcompinit
