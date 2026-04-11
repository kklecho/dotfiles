alias a='vibe'
alias viber='vibe -c'
alias agr='source .ai/.env; agr-agent-rebuild'
alias vip='agr; vibe -p'
alias vigo='agr; vibe -p go'
alias vifb='agr; vibe -p fb'

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
