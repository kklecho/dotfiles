#alias prf_="export AWS_PROFILE="
alias adm="cd $PATH_ADMIN"
alias prj="cd $PATH_PROJECT"
alias ,up="prj && ./.devup.sh"
alias ,dwn="prj && ./.devdown.sh"

alias ,t="~/,t"
alias ,t2="~/,t2"
alias ,t2e="e ~/,t2"
alias ,te="e ~/,t"
alias ,l="~/,l"
alias ,l2="~/,l2"
alias ,l2e="e ~/,l2"
alias ,le="e ~/,l"

# break long cli into multiple lines (useful for aws)
alias clibreak="sed -i.bak 's/ -- \\\\\n --/g'"

alias scratchpy="mkdir -p ~/scratch/py && cd ~/scratch/py && e ."
alias scratcsql="mkdir -p ~/scratch/sql && cd ~/scratch/sql && e ."
alias scratchp="mkdir -p ~/scratch/php && cd ~/scratch/php && e ."
alias reload!='. ~/.zshrc'

alias cls='clear'

#utility
alias histrel="history | grep -v 'ls' | grep -v 'history' | grep -v 'cat' | grep -v 'clear' | grep -v 'cd' | grep -v 'systemctl' | grep -v 'journalctl'  | grep -v 'man ' | grep -v 'apt ' | sort -r | head -n 500"
alias pst="lpass show $1 --password -c"

# the below is for copying pipe output ot clipboard on ubuntu
# ls | clip
alias clip='xsel -ib'

alias netrestart="sudo systemctl restart network-manager"
alias dotu="(cd ~/.dotfiles/ && git pull)"

if ! command -v code &> /dev/null
then
    alias localrc="code ~/.localrc --reuse-window"
else
    alias localrc="e ~/.localrc"
fi


alias proj="cd $PROJECT1"
alias proj2="cd $PROJECT2"
alias admin="cd $ADMIN"
alias plan="cd ~/Documents/plan/"

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
alias kei="ssh $KEI_USER@kei"

alias m="ssh m"
alias n="ssh n"

alias dev="ssh kkl@devkklecho.ddns.net"
alias devup="ec2up $DEV_EC2_INSTANCE"
alias devdown="ec2down $DEV_EC2_INSTANCE"

alias phps="docker-compose run php_server bash"

#databasess
alias tdbm1db="mysql --defaults-group-suffix=_tdbm1"
alias tdbs1db="mysql --defaults-group-suffix=_tdbs1"
alias mydump="mysqldump $1 | gzip > ~/dumps/$1.sql.gz"

#paths
alias repos="cd ~/repos"
alias apps="cd ~/apps"

#dev
# dev symfony
alias c="docker-compose run php_server php bin/console"
alias cmp="docker-compose run php_server composer"
# dev laravel
alias a="php artisan"

#kkl simple quiz, function trick since aliases don't accept arguments
function qq() { grep '^[A-Z]' "$quiz_file" | sed "$1"'!d'; }
function qa() { grep '^ ' "$quiz_file" | sed "$1"'!d'; }

alias df='df -h -x squashfs -x tmpfs -x devtmpfs'

alias shortshell='export PS1="$ "'
