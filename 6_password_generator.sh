#!/usr/bin/env bash
LENGTH=8
password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c "$LENGTH")
echo "$password"
