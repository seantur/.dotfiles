#!/usr/bin/env  bash
####################
# install.sh
# This script makes symlinks from the ~/.dotfiles files to $HOME
# If the dotfiles exists, it backs them up to ~/.dotfiles_old
####################

#Variables
###############
dir=$HOME/.dotfiles
old_dir=$HOME/.dotfiles_old
files=$(dir)
###############

mkdir -p $old_dir

for file in $files; do
    if [[ $file != *.* ]]; then
        if [ -e $HOME/.$file ]; then
            echo "Moving $HOME/.$file to $old_dir"
            mv $HOME/.$file $old_dir/$file
        fi
       echo "Linking $dir/$file to $HOME/.$file"
       ln -s $dir/$file $HOME/.$file
    fi
done
