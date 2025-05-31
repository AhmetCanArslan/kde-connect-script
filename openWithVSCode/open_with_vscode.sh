#!/bin/bash

for uri in "$@"; do
    path=$(echo "$uri" | sed 's/^file:\/\///' | sed 's/%20/ /g')
    code --new-window "$path"
done

