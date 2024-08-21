function hj() {
    relpath=$1

    if [ -z "$HOPAPS" ]; then
        echo "HOPAPS env var must be defined, should point to dir where hop and jl are subdirs"
        return 1
    fi

    if [ ! -f "${HOPAPS}/hop/${relpath}" ]; then
        echo "Usage: hj <relpath>"
        return 1
    fi

    if [ ! -d "${HOPAPS}/hop" ]; then
        echo "hop dir not found exists"
        return 1
    fi

    if [ ! -d "${HOPAPS}/jl" ]; then
        echo "jl dir not found exists"
        return 1
    fi

    if [ ! -f "${HOPAPS}/hop/$relpath" ]; then
        echo "file ${HOPAPS}/hop/$relpath not found"
        return 1
    fi

    cp ${HOPAPS}/hop/$relpath ${HOPAPS}/jl/$relpath
}

function jh() {
    relpath=$1

    if [ -z "$HOPAPS" ]; then
        echo "HOPAPS env var must be defined, should point to dir where hop and jl are subdirs"
        return 1
    fi

    if [ -z "${HOPAPS}/jl/${relpath}" ]; then
        echo "Usage: jh <relpath>"
        return 1
    fi

    if [ ! -d "${HOPAPS}/hop" ]; then
        echo "hop dir not found exists"
        return 1
    fi

    if [ ! -d "${HOPAPS}/jl" ]; then
        echo "jl dir not found exists"
        return 1
    fi

    if [ ! -f "${HOPAPS}/jl/$relpath" ]; then
        echo "file ${HOPAPS}/jl/$relpath not found"
        return 1
    fi

    cp ${HOPAPS}/jl/$relpath ${HOPAPS}/hop/$relpath
}