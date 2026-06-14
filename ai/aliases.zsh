alias a='vibe --max-price 0.7 '
alias viber='vibe -c --max-price 0.7 --trust --agent auto-approve'
alias agr='source .ai/.env; agr-agent-rebuild'
alias vip='vibe --max-price 0.7 --trust --agent auto-approve -p'
alias vipc='vibe -c -p'
alias vigo='vibe --max-price 0.7 --trust --agent auto-approve -p go'
alias vifb='vibe --max-price 0.7 --trust --agent auto-approve -p fb'

alias agvip='agr; vibe -p'
alias agvigo='agr; vibe -p go'
alias agvifb='agr; vibe -p fb'

alias caiaga='ssh a@$HOST_CAIAGM'
alias caiaga-std='ssh a@$HOST_CAIAGS'
alias caiagb='ssh b@$HOST_CAIAGM'
alias caiagb-std='ssh b@$HOST_CAIAGS'
alias aiaga='(ssh a@$HOST_CAIAGM)'
alias aiaga-std='(ssh a@$HOST_CAIAGS)'
alias aiagb='(ssh b@$HOST_CAIAGM)'
alias aiagb-std='(ssh b@$HOST_CAIAGS)'

alias aiagupm='(cd $PTH_AIAG_MINI; vagrant up)'
alias aiagups='(cd $PTH_AIAG_STD; vagrant up)'


alias caiagupm='fn_aws_add_ec2_to_hosts aiag-mini-kkl-cloud aiag-mini-kkl-cloud; echo "now:\ncaiagip-push; caiagip-pull; srclocalrc"'
alias caiagups='fn_aws_add_ec2_to_hosts aiag-std-kkl-cloud aiag-std-kkl-cloud; echo "now:\ncaiagip-push; caiagip-pull; srclocalrc"'
alias caiagip-push='fn_aiag_ip_push'
alias caiagip-pull='fn_aiag_ip_pull'
alias k='[[ -f .tsk.md ]] && (mkdir -p .scratch/.done 2>/dev/null) && ts=$(date +%Y%m%d%H%M%S) && cp .tsk.md .scratch/.done/$ts.tsk.md && (mv .cmt.txt .scratch/.done/$ts.cmt.txt 2>/dev/null)'

alias takeskill=fn_takeskill

