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


function fcl-feedback-copy-to-local(){
  cur_hsh=$(git rev-parse --short HEAD)
  hsh=${1:-"$cur_hsh"}
  cp -r /tmp/reviewer-feedback-*${hsh}* ~/
}

function vibe-apply-feedback() {
  cur_hsh=$(git rev-parse --short HEAD)
  hsh=${1:-"$cur_hsh"}
  folder=$(ls -d $HOME/* | grep 'reviewer-feedback-' | grep "${hsh}" | tail -1)
  if [[ -d "$folder" && -z "$(ls -A "$folder")" ]]; then
    echo "Folder is empty"
    exit 1
  fi

  mv $(ls $folder/*-feedback.txt | head -1) .feedback.txt
  mv $(ls $folder/*-commit.txt | head -1) .commit.txt

  vibe -p "Apply review feedback provided in @./.feedback.txt"
}

function fn_takeskill() { 
  mkdir -p .vibe/skills 2>/dev/null; 
  [[ -d "$1" ]] && echo "$1" && rsync -av "$1" .vibe/skills 
}

