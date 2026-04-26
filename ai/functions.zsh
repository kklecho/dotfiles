function fn_aiag_ip_push() {
    ip_mini=$(fn_aws_get_ec2_public_ip aiag-mini-kkl-cloud)
    ip_std=$(fn_aws_get_ec2_public_ip aiag-std-kkl-cloud)
    ssh kshishkin@kei 'rm .aiags 2>/dev/null'
    ssh kshishkin@kei 'rm .aiagsrc 2>/dev/null'
    ssh kshishkin@kei "echo ${ip_mini} aiag-mini-kkl-cloud >> .aiags"
    ssh kshishkin@kei "echo ${ip_std} aiag-std-kkl-cloud >> .aiags"
    ssh kshishkin@kei "echo export HOST_CAIAGM=${ip_mini} >> .aiagsrc"
    ssh kshishkin@kei "echo export HOST_CAIAGS=${ip_std} >> .aiagsrc"
}

function fn_aiag_ip_pull() {
    scp kshishkin@${HOST_KEI:-kei}:~/.aiags ~/
    scp kshishkin@${HOST_KEI:-kei}:~/.aiagsrc ~/
    cat ~/.aiagsrc >> ~/.localrc
}

# function fn_agr_mini() {
#   fn_rebuild_agent_files
#   ( 
#     cd ~/prj/prjnow
#     rsync -av --copy-links .aiag-profiles/agents-andy.md a@aiag-std-kkl:~/repos/hopcar/AGENTS.md
#     rsync -av --copy-links .aiag-profiles/agents-bobby.md b@aiag-std-kkl:~/repos/hopcar/AGENTS.md
#   ) 
# }

# function fn_agr_std() {
#   fn_rebuild_agent_files
#   ( 
#     cd ~/prj/prjnow
#     rsync -av --copy-links .aiag-profiles/agents-andy.md a@aiag-std-kkl:~/repos/hopcar/AGENTS.md
#     rsync -av --copy-links .aiag-profiles/agents-bobby.md b@aiag-std-kkl:~/repos/hopcar/AGENTS.md
#   ) 
# }


function vibe-apply-feedback() {
  cur_hsh=$(git rev-parse --short HEAD)
  hsh=${1:-"$cur_hsh"}
  for f in $(ls /tmp/reviewer-feedback-*${hsh}*/*.txt | head -1)
  do
    vibe -p "Apply review feedback provided in @$f"
    mv $f ./feedback.txt
  done
}

