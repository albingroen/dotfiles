# Set the default terminal to support 256 colors
set -g default-terminal "screen-256color"

# Enable RGB color support
set-option -sa terminal-overrides ",xterm*:Tc"

# Status bar colors
set -g status-style bg='#f0f0f0',fg='#4a4a4a'

# Window status colors
set -g window-status-style bg='#f0f0f0',fg='#4a4a4a'
set -g window-status-current-style bg='#e0e0e0',fg='#005f87',bold

# Pane border colors
set -g pane-border-style fg='#d0d0d0'
set -g pane-active-border-style fg='#005f87'

# Message colors
set -g message-style bg='#e0e0e0',fg='#005f87'

# Clock color
set -g clock-mode-colour '#005f87'

# Status bar configuration
set -g status-left-length 40
set -g status-left "#[fg=#005f87,bold] #S #[fg=#4a4a4a,nobold] "
set -g status-right "#[fg=#005f87] %Y-%m-%d #[fg=#4a4a4a] | #[fg=#005f87,bold]%H:%M "

# Window status format
setw -g window-status-format " #I:#W "
setw -g window-status-current-format " #I:#W "
