function ghdeploykey() {
    repo=$1
    if [[ $repo == *"/"* ]] && [[ $repo == *"git@github.com"* ]] && [[ $repo == *".git"* ]]
    then
        repo_name=`basename $1 .git`
        echo "Generating github deploy key for $repo_name" 

        mkdir -p $HOME/.github/.ssh/$repo_name

        ssh-keygen -t rsa -b 4096 -C "$repo" -f $HOME/.github/.ssh/$repo_name/id_rsa
    else
        echo "This is not valid github repo: '$repo'"
        echo "Usage: ghdeploykey <repo ssh uri: git@github.com:owner/repo.git>"
    fi
}
