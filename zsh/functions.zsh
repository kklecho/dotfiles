function clwd(){ ( echo $PWD | clip ) }
function clpubkey(){ ( cat ~/.ssh/id_rsa.pub | clip ) }
function xl(){ 
    gnumeric --no-splash $1 >/dev/null 2>&1 &; disown 
}
