# dotfiles

Configuration files for my development environment across macOS and Linux systems.

## Configuration Files

This repository includes configuration files for:

### Terminal & Shell
- [Fish Shell](https://fishshell.com) - Modern shell with autocompletion and syntax highlighting
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer

### Text Editors
- [Neovim](https://neovim.org) - Hyperextensible Vim-based text editor

### Terminal Emulators
- [Kitty](https://sw.kovidgoyal.net/kitty/) - GPU-based terminal emulator

### Package Management
- [Homebrew](https://brew.sh) - Package manager for macOS (see `brew.md` for installed packages)

## Structure

```
dotfiles/
├── fish/           # Fish shell configuration
├── nvim/           # Neovim configuration with Lua
├── kitty/          # Kitty terminal emulator config
└── .tmux.conf      # Tmux configuration
```

## Installation

These dotfiles are designed to work across both macOS and Linux environments. Symlink the appropriate configuration files to their expected locations in your home directory or `.config` folder.
