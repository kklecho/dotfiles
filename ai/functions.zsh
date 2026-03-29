fn_aiag_ip_push() {
    ip_mini=$(fn_aws_get_ec2_public_ip aiag-mini-kkl-cloud)
    ip_std=$(fn_aws_get_ec2_public_ip aiag-std-kkl-cloud)
    ssh kshishkin@kei 'rm .aiags 2>/dev/null'
    ssh kshishkin@kei 'rm .aiagsrc 2>/dev/null'
    ssh kshishkin@kei "echo ${ip_mini} aiag-mini-kkl-cloud >> .aiags"
    ssh kshishkin@kei "echo ${ip_std} aiag-std-kkl-cloud >> .aiags"
    ssh kshishkin@kei "echo export host_caiagm=${ip_mini} >> .aiagsrc"
    ssh kshishkin@kei "echo export host_caiags=${ip_std} >> .aiagsrc"
}

fn_aiag_ip_pull() {
    scp kshishkin@kei:~/.aiags ~/
    scp kshishkin@kei:~/.aiagsrc ~/
    cat ~/.aiagsrc >> ~/.localrc
}
