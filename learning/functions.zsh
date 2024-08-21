function lrn() {
    context=$1
    question=$2
    answer=$3
    TODAY=$(date +%Y%m%d)
    FILE_PATH=~/lrn/${HOST}_${TODAY}_learning.csv

    echo "$question \n\t$answer"

    echo "\n\n--context: $context"

    echo "\"$context\",\"$question\",\"$answer\""
    
    if [ ! -f $FILE_PATH ]; then
        echo "question:answer:context" > $FILE_PATH
    fi

    echo "\"$question\":\"$answer\":\"$context\"" >> $FILE_PATH
    echo $FILE_PATH
}

function lrx() {
    if [ -z $CONTEXT ]; then
        echo "No context set"
        return
    fi
    lrn $CONTEXT $1 $2
}

function lrpsh(){
    rsync -av ~/lrn/ ${KEI_SSH_USER}@${KEI_SSH_HOST}:~/lrn/
}

function lrpl(){
    rsync -av ${KEI_SSH_USER}@${KEI_SSH_HOST}:~/lrn/ ~/lrn/
}


function ctx() {
    CONTEXT=$1
    echo "export CONTEXT=\"$CONTEXT\"" >> ~/.localrc
    echo "Switched context to $CONTEXT"
}


#kkl simple quiz, function trick since aliases don't accept arguments
function qq() { grep '^[A-Z]' "$quiz_file" | sed "$1"'!d'; }
function qa() { grep '^ ' "$quiz_file" | sed "$1"'!d'; }
