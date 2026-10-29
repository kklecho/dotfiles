set -g status-bg black
set -g status-fg white
unbind C-b
set -g prefix C-h

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'

setw -g mode-keys vi
