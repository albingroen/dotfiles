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

set -gx fish_cursor_default block
set -gx fish_cursor_insert line
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore
set fish_vi_force_cursor 1
set -gx HYPRSHOT_DIR ~/Pictures/Screenshots

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
abbr -a nd "npm run dev"
abbr -a d "docker"
abbr -a dc "docker compose"
abbr -a rebase "git checkout master && git pull && git checkout - && git rebase -"
abbr -a sync "git commit -m 'sync'"
abbr -a m1 "hyprctl dispatch moveworkspacetomonitor '0 0' && hyprctl dispatch moveworkspacetomonitor '1 0' && hyprctl dispatch moveworkspacetomonitor '2 0' && hyprctl dispatch moveworkspacetomonitor '3 0'"
abbr -a m2 "hyprctl dispatch moveworkspacetomonitor '0 1' && hyprctl dispatch moveworkspacetomonitor '1 1' && hyprctl dispatch moveworkspacetomonitor '2 1' && hyprctl dispatch moveworkspacetomonitor '3 1'"
abbr -a y "yazi"

# Zoxide
zoxide init fish | source

# FZF
fzf --fish | source

# SSH agent
fish_ssh_agent
