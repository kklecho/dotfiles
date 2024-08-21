alias prf_="export AWS_PROFILE="
alias adm="cd $PATH_ADMIN"
alias proj2="cd $PROJECT2"
alias admin="cd $ADMIN"
alias plan="cd ~/Documents/plan/"

alias reload!='. ~/.zshrc'

alias cls='clear'

#utility
alias histrel="history | grep -v 'ls' | grep -v 'history' | grep -v 'cat' | grep -v 'clear' | grep -v 'cd' | grep -v 'systemctl' | grep -v 'journalctl'  | grep -v 'man ' | grep -v 'apt ' | sort -r | head -n 500"
alias pst="lpass show $1 --password -c"
alias pwdclp="echo $PWD | clip"
# the below is for copying pipe output ot clipboard on ubuntu

if command -v xsel &> /dev/null
then
    alias clip='xsel -ib'
else
    alias clip='pbcopy'
fi

alias netrestart="sudo systemctl restart network-manager"
alias dotu="(cd ~/.dotfiles/ && git pull)"

if command -v code &> /dev/null
then
    alias localrc="code ~/.localrc --reuse-window"
else
    alias localrc="e ~/.localrc"
fi



#project juggling
alias projtolocal="rsync -a ~/project/ ~/ProjectLocal/ --delete"
alias projfromlocal="rsync -a ~/ProjectLocal/ ~/project/"
alias projtoarchives="mv ~/ProjectLocal/*.7z ~/PersonalProjects/"
alias projarchivetopendrive="rsync -av ~/PersonalProjects/ /media/kkl/ProjectsEncrypte/PersonalProjects/"
function projfromarchives() { sudo rm -R ~/project/* ~/ProjectLocal/*; cp ~/PersonalProjects/$1.7z ~/Project/; cd ~/Project; 7z x *.7z; }
alias projfromusb="rsync -av /media/ProjectArchive/PersonalProjects/ ~/PersonalProjects/"
alias projtousb="rsync -av ~/PersonalProjects/ /media/ProjectArchive/PersonalProjects/"

#security
alias ip6down="sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1"
alias ip6up="sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0"
alias vpndown="sudo /etc/init.d/openvpn stop"
alias vpnup="sudo /etc/init.d/openvpn start"

#ssh
alias tb1="ssh kkl@tb1"
alias tn1="ssh kkl@tn1"
alias tn2="ssh kkl@tn2"
alias tdbm1="ssh kkl@tdbm1"
alias tds1="ssh kkl@tdbs1"
alias tstatic="ssh kkl@tstatic"
alias kei="ssh $KEI_SSH_USER@kei"

alias m="ssh m"
alias n="ssh n"

alias df='df -h -x squashfs -x tmpfs -x devtmpfs'

alias shortshell='export PS1="$ "'
alias sts='shortshell'
alias cpdirname="basename $PWD | clip"
