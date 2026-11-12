set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g status-bg purple
set -g status-fg white
unbind C-b
set -g prefix C-j
setw -g mode-keys vi

run '~/.tmux/plugins/tpm/tpm'
