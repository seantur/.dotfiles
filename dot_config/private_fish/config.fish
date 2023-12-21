#!/usr/bin/env fish

set fish_greeting ''

fish_add_path -p $HOME/.local/bin /opt/bin $HOME/go/bin
set -x EDITOR nvim

starship init fish | source
source /opt/asdf-vm/asdf.fish
direnv hook fish | source # https://direnv.net/docs/hook.html

