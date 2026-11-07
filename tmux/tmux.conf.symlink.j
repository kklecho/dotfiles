set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g status-bg orange
#set -g status-fg black
unbind C-b
set -g prefix C-j

run '~/.tmux/plugins/tpm/tpm'
