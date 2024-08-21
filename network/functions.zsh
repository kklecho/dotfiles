function nc_serve_file() {

    filepath=$1

    if [ ! -f "$file" ]; then
        echo "usage: $0 /file/path"
        return 1
    fi

    { 
        echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c <$filepath)\r\n\r\n"; \
        cat $filepath; 
    } \
    | nc -l 8080
}