#!/usr/bin/env bash

LOADED_VERSION=$(uname -a | awk '{print $3}')
INSTALLED_VERSION=$(pacman -Qi linux | grep Version | awk '{print $3}')

if [ "$LOADED_VERSION" != "$INSTALLED_VERSION" ]; then
    echo -e '\uf021'
fi
