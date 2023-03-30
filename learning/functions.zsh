function lrn() {
    context=$1
    question=$2
    answer=$3
    TODAY=$(date +%Y%m%d)
    echo "$question \n\t$answer"

    echo "\n\n--context: $context"

    echo "\"$context\",\"$question\",\"$answer\""

    if [ ! -f ~/Desktop/${TODAY}_learning.csv ]; then
        echo "context,question,answer" > ~/Desktop/${TODAY}_learning.csv
    fi

    echo "\"$context\",\"$question\",\"$answer\"" >> ~/Desktop/${TODAY}_learning.csv
}

function lrx() {
    if [ -z $CTX ]; then
        echo "No context set"
        return
    fi
    lrn $CTX $1 $2
}
