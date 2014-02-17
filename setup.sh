#!/bin/bash

set -e
set -o nounset

profiles="$HOME/Library/Application Support/Firefox/Profiles"
src=`cd $(dirname $BASH_SOURCE) && pwd`

for profile in "$profiles"/*.default; do
    echo "$profile"

    chrome="$profile/chrome"
    mkdir -p "$chrome"

    cd "$chrome"
    ln -sf "$src/userChrome.css"
    ln -sf "$src/userContent.css"
done
