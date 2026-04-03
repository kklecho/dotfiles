alias a="vibe -y"
alias viber="vibe --continue -y"
alias vibey="vibe -y"

## caiag
alias caiaga="ssh a@$host_caiagm"
alias caiaga-std="ssh a@$host_caiags"

alias caiagb="ssh b@$host_caiagm"
alias caiagb-std="ssh b@$host_caiags"

alias caiagupm="fn_aws_add_ec2_to_hosts aiag-mini-kkl-cloud aiag-mini-kkl-cloud; echo 'now caiagip-push'"
alias caiagups="fn_aws_add_ec2_to_hosts aiag-std-kkl-cloud aiag-std-kkl-cloud; echo 'now caiagip-push'"
alias caiagip-push="fn_aiag_ip_push"
alias caiagip-pull="fn_aiag_ip_pull"

## aiag
alias aiaga="(ssh a@$host_aiag_mini)"
alias aiaga-std="(ssh a@$host_aiag_std)"
alias aiagb="(ssh b@$host_aiag_mini)"
alias aiagb-std="(ssh b@$host_aiag_std)"

alias aiagupm="(cd $PTH_AIAG_MINI; vagrant up)"
alias aiagups="(cd $PTH_AIAG_STD; vagrant up)"

## agents files
alias agr-agent-rebuild=fn_rebuild_agent_files
