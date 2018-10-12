#!/usr/bin/env bash
# Grab the current left and right audio channel volume levels using amixer

L=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }')
R=$(amixer sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')
 
echo "L:$L R:$R"
