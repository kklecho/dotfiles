set -g status-bg blue
set -g status-fg white

unbind C-b
set -g prefix C-k

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
setw -g mode-keys vi
