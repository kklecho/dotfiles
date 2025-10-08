alias d='docker $*'
alias dc='docker compose $*'

alias dcu="docker compose up -d"
alias dcs="docker compose stop"
alias dcb="docker compose build"
alias dce='docker compose exec'
alias dcl='docker compose logs'
alias dcps='docker compose ps'

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
