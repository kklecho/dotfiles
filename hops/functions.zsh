function hj() {
    relpath=$1

    if [ -z "$HOPAPS" ]; then
        echo "HOPAPS env var must be defined, should point to dir where hop and jl are subdirs"
        return 1
    fi

    cd $HOPAPS

    if [ -z "relpath" ]; then
        echo "Usage: hj <relpath>"
        return 1
    fi

    if [ ! -d "hop" ]; then
        echo "hop dir not found exists"
        return 1
    fi

    if [ ! -d "jl" ]; then
        echo "jl dir not found exists"
        return 1
    fi

    if [ ! -f "hop/$relpath" ]; then
        echo "hop dir not found exists"
        return 1
    fi

    cp hop/$relpath jl/$relpath
}

function jh() {
    relpath=$1

    if [ -z "$HOPAPS" ]; then
        echo "HOPAPS env var must be defined, should point to dir where hop and jl are subdirs"
        return 1
    fi

    cd $HOPAPS

    if [ -z "relpath" ]; then
        echo "Usage: hj <relpath>"
        return 1
    fi

    if [ ! -d "hop" ]; then
        echo "hop dir not found exists"
        return 1
    fi

    if [ ! -d "jl" ]; then
        echo "jl dir not found exists"
        return 1
    fi

    if [ ! -f "jl/$relpath" ]; then
        echo "hop dir not found exists"
        return 1
    fi

    cp jl/$relpath hop/$relpath
}