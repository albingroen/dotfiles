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
- [Ghostty](https://mitchellh.com/ghostty) - Fast, native terminal emulator

### Linux Desktop Environment (Hyprland)
- [Hyprland](https://hyprland.org) - Dynamic tiling Wayland compositor
- [Waybar](https://github.com/Alexays/Waybar) - Highly customizable status bar
- Hypridle - Idle daemon configuration
- Hyprlock - Screen locker configuration
- Hyprpaper - Wallpaper utility configuration

### Package Management
- [Homebrew](https://brew.sh) - Package manager for macOS (see `brew.md` for installed packages)
  - pacman/yay.md files will be added in the future.

## Structure

```
dotfiles/
├── fish/           # Fish shell configuration
├── nvim/           # Neovim configuration with Lua
├── kitty/          # Kitty terminal emulator config
├── ghostty/        # Ghostty terminal emulator config
├── hypr/           # Hyprland window manager configs
├── waybar/         # Waybar status bar configuration
├── .tmux.conf      # Tmux configuration
└── brew.md         # List of Homebrew packages and casks
```

## Installation

These dotfiles are designed to work across both macOS and Linux environments. Symlink the appropriate configuration files to their expected locations in your home directory or `.config` folder.
