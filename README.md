# dotfiles

Configuration files for my development environment across macOS and Linux systems.

## Configuration Files

This repository includes configuration files for:

### Terminal & Shell
- [Fish Shell](https://fishshell.com) - Modern shell with autocompletion and syntax highlighting
  - Hybrid vi/emacs key bindings
  - Custom abbreviations for Git, Docker, and development workflows
  - Integrated with [Zoxide](https://github.com/ajeetdsouza/zoxide) for smart directory jumping
  - Integrated with [FZF](https://github.com/junegunn/fzf) for fuzzy finding
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
  - Custom prefix key (Ctrl-a)
  - Mouse support enabled
  - Minimal status bar theme
  - Integrated with [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) for seamless pane navigation

### Text Editors
- [Neovim](https://neovim.org) - Hyperextensible Vim-based text editor
  - Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
  - LSP support with autocompletion
  - Key plugins:
    - [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
    - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
    - [Blink](https://github.com/saghen/blink.cmp) - Completion engine
    - [Conform](https://github.com/stevearc/conform.nvim) - Code formatting
    - [Oil](https://github.com/stevearc/oil.nvim) - File explorer
    - [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git integration
    - [Which-key](https://github.com/folke/which-key.nvim) - Keybinding hints

### Terminal Emulators
- [Ghostty](https://ghostty.org) - Fast, native terminal emulator
  - Fish shell integration
  - Custom font sizing and cursor configuration
  - Theme support with light/dark mode (Nvim Light/Dark themes)
  - Global quick terminal toggle (Cmd+Ctrl+T)

## Structure

```
dotfiles/
├── fish/
│   └── config.fish       # Fish shell configuration with abbreviations
├── nvim/
│   ├── init.lua          # Neovim entry point
│   └── lua/
│       ├── basics.lua    # Basic settings and keymaps
│       └── plugins/      # Plugin configurations
├── ghostty/
│   └── config            # Ghostty terminal emulator config
└── .tmux.conf            # Tmux configuration
```

## Installation

These dotfiles are designed to work across both macOS and Linux environments. Symlink the appropriate configuration files to their expected locations in your home directory or `.config` folder.
