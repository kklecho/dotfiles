function lrn() {
    context=$1
    question=$2
    answer=$3
    TODAY=$(date +%Y%m%d)
    echo "$question \n\t$answer"

    echo "\n\n--context: $context"

    echo "\"$context\",\"$question\",\"$answer\""
    echo "\"$context\",\"$question\",\"$answer\"" >> ~/Desktop/${TODAY}_learning.csv
}

