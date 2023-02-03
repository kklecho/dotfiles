function encr_encrypt_file() {
    local file=$1
    local encrypted_file=$2

    if [[ -z $encrypted_file ]]; then
        encrypted_file=$file.enc
    fi

    openssl aes-256-cbc -a -salt -pbkdf2 -in $file -out $encrypted_file
}

function decr_decrypt_file() {
    local encrypted_file=$1
    local decrypted_file=$2

    if [[ -z $decrypted_file ]]; then
        decrypted_file=$encrypted_file.dec
    fi

    openssl aes-256-cbc -d -a -pbkdf2 -in $encrypted_file -out $decrypted_file
}
