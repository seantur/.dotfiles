#!/usr/bin/env bash
# Script to format speedtest-cli results for polybar

SPEED=$(speedtest --simple)

DL=$( echo "$SPEED" | grep Download: | cut -d " " -f2)
UL=$( echo "$SPEED" | grep Upload: | cut -d " " -f2)

echo "DL $DL Mbit/s  UL $UL Mbit/s"
