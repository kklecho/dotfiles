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


function ghfromtemplate() {
    template_repo=$1
    new_repo_path=$2
    new_repo_name=`basename $new_repo_path`

    if [ -d "$new_repo_path" ]; then
        echo "Repo $new_repo_name already exists"
        return 1
    fi

    if [ -z "new_repo_path" ]; then
        echo "Usage: newminlib <new_repo_path>"
        return 1
    fi

    if ! command -v gh &> /dev/null
    then
        echo "could not create repo $new_repo_name"
        echo "gh missing"
        echo "install github cli: https://cli.github.com/"
        return 1
    fi

    if [ -z "$GH_USER" ]; then
        echo "GH_USER not set"
        echo "set GH_USER in your environment"
        echo "e.g. export GH_USER=kklecho"
        return 1
    fi

    gh repo create $new_repo_name --private --template $template_repo
    sleep 3

    git clone git@github.com:$GH_USER/$new_repo_name.git $new_repo_path

    if [ -z "$new_repo_path" ]; then
        echo "Repo $new_repo_name not found"
        return 1
    fi

    echo "Created repo $new_repo_name and cloned to $new_repo_path"

    return 0
}