#!/usr/bin/env bash

if [ -z "$(ip a | grep wg0)" ]; then
    echo "🔓 "
else
    echo "🔒 "
fi
