function lrn() {
    context=$1
    question=$2
    answer=$3
    TODAY=$(date +%Y%m%d)
    echo "$question \n\t$answer"

    echo "\n\n--context: $context"

    echo "\"$context\",\"$question\",\"$answer\""
    
    if [ ! -f ~/Desktop/lrn/${TODAY}_learning.csv ]; then
        echo "context,question,answer" > ~/Desktop/lrn/${TODAY}_learning.csv
    fi

    echo "\"$context\",\"$question\",\"$answer\"" >> ~/Desktop/lrn/${TODAY}_learning.csv
    echo ~/Desktop/lrn/${TODAY}_learning.csv
}

function lrx() {
    if [ -z $CONTEXT ]; then
        echo "No context set"
        return
    fi
    lrn $CONTEXT $1 $2
}


function ctx() {
    CONTEXT=$1
    echo "export CONTEXT=\"$CONTEXT\"" >> ~/.localrc
    echo "Switched context to $CONTEXT"
}
