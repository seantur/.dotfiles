#!/usr/bin/env  bash
####################
# makesymlinks.sh
# This script makes symlinks from
# the ~/.dotfiles files to $HOME
####################

#Variables
###############
dir=$HOME/.dotfiles
files=$(dir)
###############


for file in $files; do
    if [[ $file != *.sh ]]; then
        echo "Linking $dir/$file to $HOME/.$file"
        ln -s $dir/$file $HOME/.$file
    fi
done
