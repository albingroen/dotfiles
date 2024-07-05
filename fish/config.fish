#!/usr/bin/fish

if status is-interactive
    function fish_hybrid_key_bindings --description \
        "Vi-style bindings that inherit emacs-style bindings in all modes"
        for mode in default insert visual
            fish_default_key_bindings -M $mode
        end
        fish_vi_key_bindings --no-erase
    end

    set -g fish_key_bindings fish_hybrid_key_bindings
end

# Disable greeting
set -g -x fish_greeting ""

# Abbreviations
abbr -a vim nvim
abbr -a v nvim
abbr -a cl clear
abbr -a g git
abbr -a cgs "clear && git status"
abbr -a gs "git status"
abbr -a gc "git commit"
abbr -a ga "git add ."
abbr -a gl "git log --pretty=oneline"
abbr -a gch "git checkout"
abbr -a gps "git push"
abbr -a gpsf "git push --force-with-lease"
abbr -a gpl "git pull"
abbr -a gd "git diff"
abbr -a gb "git branch"
abbr -a gr "git rebase"
abbr -a amend "git commit --amend"
abbr -a ls "tree -L 1 -a"
abbr -a l "tree -L 1 -a"
abbr -a rb "git checkout main && git pull && git checkout - && git rebase main"
abbr -a bu "brew upgrade"
abbr -a cat "bat"

# Zoxide
zoxide init fish | source

# Fish
fzf --fish | source
