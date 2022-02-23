alias reload!='. ~/.zshrc'

alias cls='clear'

#utility
alias histrel="history | grep -v 'ls' | grep -v 'history' | grep -v 'cat' | grep -v 'clear' | grep -v 'cd' | grep -v 'systemctl' | grep -v 'journalctl'  | grep -v 'man ' | grep -v 'apt ' | sort -r | head -n 500"
alias pst="lpass show $1 --password -c"
alias netrestart="sudo systemctl restart network-manager"

alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcs="docker-compose stop"
alias d="docker"

alias dcb="docker-compose build"
alias dce='docker-compose exec'
alias dcl='docker-compose logs'
alias dcps='docker-compose ps'
alias docker_daemon_stop='sudo snap stop docker'
alias docker_daemon_start='sudo snap start docker'
alias phps="docker-compose run php_server bash"
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

#project juggling
alias projtolocal="rsync -a ~/project/ ~/ProjectLocal/ --delete"
alias projfromlocal="rsync -a ~/ProjectLocal/ ~/project/"
alias projtoarchives="mv ~/ProjectLocal/*.7z ~/PersonalProjects/"
alias projarchivetopendrive="rsync -av ~/PersonalProjects/ /media/kkl/ProjectsEncrypte/PersonalProjects/"
function projfromarchives() { sudo rm -R ~/project/* ~/ProjectLocal/*; cp ~/PersonalProjects/$1.7z ~/Project/; cd ~/Project; 7z x *.7z; }
alias projfromusb="rsync -av /media/ProjectArchive/PersonalProjects/ ~/PersonalProjects/"
alias projtousb="rsync -av ~/PersonalProjects/ /media/ProjectArchive/PersonalProjects/"
alias proj="cd ~/project"
alias projl="cd ~/ProjectLocal"

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
alias kei="ssh kshishkin@kei"

alias m="ssh m"
alias n="ssh n"

alias dev="ssh devkklecho.ddns.net"
alias devup="ec2up $DEV_EC2_INSTANCE"
alias devdown="ec2down $DEV_EC2_INSTANCE"

#databasess
alias tdbm1db="mysql --defaults-group-suffix=_tdbm1"
alias tdbs1db="mysql --defaults-group-suffix=_tdbs1"
alias dbdump="mysqldump $1 | gzip > ~/dumps/$1.sql.gz"

#paths
alias repos="cd ~/repos"
alias apps="cd ~/apps"
alias app="cd ~/app"

#clouds
alias ec2down="aws ec2 stop-instances --instance-ids $1"
alias ec2up="aws ec2 start-instances --instance-ids $1"

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
