#!/bin/bash

{
    set -e

    cd ~/Library/Rime
    (git fetch --all && git rebase remote/main) || osascript -e 'display notification "update rime repo failed" with title "Rime Update Failed"'
    git push -f --no-verify -u origin

    cd ~/Library/Mobile\ Documents/iCloud~dev~fuxiao~app~hamsterapp/Documents/RIME/Rime
    (git fetch --all && git rebase remote/main) || osascript -e 'display notification "update rime repo failed" with title "Rime Update Failed"'
    git push -f --no-verify -u origin

    sleep 3

    /Library/Input\ Methods/Squirrel.app/Contents/MacOS/Squirrel --sync
    /Library/Input\ Methods/Squirrel.app/Contents/MacOS/Squirrel --reload
} 2>&1
