alias wrklog="e $PATH_WORKLOG_CSV"
alias brk="lg brk"
alias ah="lg adhoc"
alias td="todo"
alias todos="ls ~/Desktop | grep TODO"
alias t="todo"
alias cu="catchup.py"
alias kldl="echo"
alias kloa="cu kl-oa"
alias cue="[[ -f $PATH_ADMIN_CATCHUP_PUBLIC ]] && e $PATH_ADMIN_CATCHUP_PUBLIC"
alias bd="echo $@ >> $PATH_ADMIN/01_brain_dump/$(date +%Y%m%d)_brain_dump.yaml"
alias bde="e $PATH_ADMIN/01_brain_dump"
alias prj="cd $PATH_PROJECT"
alias prje="cd $PATH_PROJECT; e ."
