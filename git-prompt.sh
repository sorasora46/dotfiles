#!/usr/bin/bash

# store this in ~/.config/git-prompt.sh

git_prompt() {
    local branch="$(git branch --show-current 2>/dev/null)"

    [ -n "${branch}" ] && echo " (${branch}) "
}

git_prompt
