function fn_git_configure_ssh_key() {
  prv_key_path=$1

  if [[ ! -f $prv_key_path ]]; then
    echo "Usage fn_git_configure_ssh_key <private_key_path>"
    exit 1
  fi
  git config core.sshCommand "ssh -i $prv_key_path"
}
