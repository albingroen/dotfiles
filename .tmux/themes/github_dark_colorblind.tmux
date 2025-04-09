# Set the default terminal to support 256 colors
set -g default-terminal "screen-256color"

# Enable RGB color support
set-option -sa terminal-overrides ",xterm*:Tc"

# Status bar colors
set -g status-style bg='#1c1c1c',fg='#d0d0d0'

# Window status colors
set -g window-status-style bg='#1c1c1c',fg='#d0d0d0'
set -g window-status-current-style bg='#303030',fg='#87afff',bold

# Pane border colors
set -g pane-border-style fg='#3a3a3a'
set -g pane-active-border-style fg='#87afff'

# Message colors
set -g message-style bg='#303030',fg='#87afff'

# Clock color
set -g clock-mode-colour '#87afff'

# Status bar configuration
set -g status-left-length 40
set -g status-left "#[fg=#87afff,bold] #S #[fg=#d0d0d0,nobold] "
set -g status-right "#[fg=#87afff] %Y-%m-%d #[fg=#d0d0d0] | #[fg=#87afff,bold]%H:%M "

# Window status format
setw -g window-status-format " #I:#W "
setw -g window-status-current-format " #I:#W "
