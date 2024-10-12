function list-big-packages() {
    dpkg-query -W -f='${Installed-Size;8}  ${Package}\n' | sort -n
}
