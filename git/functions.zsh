function fn_git_configure_ssh_key() {
  prv_key_path=$1

  if [[ ! -f $prv_key_path ]]; then
    echo "Usage fn_git_configure_ssh_key <private_key_path>"
    exit 1
  fi
  git config core.sshCommand "ssh -i $prv_key_path"
}

fn_gbdc() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Error: Not a git repository." >&2
        return 1
    fi

    local current_branch
    current_branch=$(git symbolic-ref --short HEAD 2>/dev/null)

    if [[ "$current_branch" == "main" || "$current_branch" == "master" ]]; then
        echo "Error: Already on default branch ($current_branch)." >&2
        return 1
    fi

    if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
        echo "Error: There are uncommitted local changes." >&2
        return 1
    fi

    local default_branch
    if git show-ref --verify --quiet refs/heads/main 2>/dev/null; then
        default_branch="main"
    elif git show-ref --verify --quiet refs/heads/master 2>/dev/null; then
        default_branch="master"
    else
        echo "Error: Neither 'main' nor 'master' branch exists locally." >&2
        return 1
    fi

    echo "About to switch to $default_branch and delete $current_branch"
    read -q "REPLY?Are you sure you want to proceed? [y/N] "
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Operation cancelled." >&2
        return 1
    fi

    echo "Switching to $default_branch and deleting $current_branch..."
    git checkout "$default_branch" && git branch -D "$current_branch"
}

