#!/usr/bin/env bash

LOADED_VERSION=$(uname -a | awk '{print $3}' | cut -d "-" -f 1)
INSTALLED_VERSION=$(pacman -Qi linux | grep Version | awk '{print $3}' | cut -d "." -f 1-3)

if [ "$LOADED_VERSION" != "$INSTALLED_VERSION" ]; then
    echo -e '\uf021'
fi
