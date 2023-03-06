function nowcli(){ 
    client=$*

    if [ -z "$client" ]; then
        echo "Client name is required"
        return 1
    fi

    echo 'export NOW_CLIENT="'$client'"' >> ~/.localrc; 
    export NOW_CLIENT=$client 
}

function nowprj(){ 
    project=$*

    if [ -z "$project" ]; then
        echo "Project name is required"
        return 1
    fi

    echo 'export NOW_PROJECT="'$project'"' >> ~/.localrc;
    export NOW_PROJECT=$project 
}

function nowtsk(){ 
    task=$*

    if [ -z "task" ]; then
        echo "Task name is required"
        return 1
    fi

    echo 'export NOW_TASK="'$task'"' >> ~/.localrc;
    export NOW_TASK=$task 
}

function lg(){ 
    # work log
    now=$(date +"%Y-%m-%dT%H:%M:%S")
    what=$*

    if [ -z "$PATH_WORKLOG_CSV" ]; then
        echo "PATH_WORKLOG_CSV is not set"
        return 1
    fi

    if [ -z "$NOW_CLIENT" ]; then
        echo "NOW_CLIENT is not set"
        return 1
    fi

    if [ -z "$NOW_PROJECT" ]; then
        echo "NOW_PROJECT is not set"
        return 1
    fi

    if [ -z "$NOW_TASK" ]; then
        echo "NOW_TASK is not set"
        return 1
    fi

    if [ ! -f $PATH_WORKLOG_CSV ]; then
        touch $PATH_WORKLOG_CSV
        echo "date,client,project,task,what" > $PATH_WORKLOG_CSV
    fi

    if [[ $what == "brk" ]]; then
        echo "$now,,,,BREAK" >> $PATH_WORKLOG_CSV
        tac $PATH_WORKLOG_CSV | head -n 1
        return 0
    fi

    if [ -z "$what" ]; then
        echo "lg brk"
        echo "or lg <what_you_are_doing>"
        echo "or lg"
        tac $PATH_WORKLOG_CSV
    else
        echo "$now,\"$NOW_CLIENT\",\"$NOW_PROJECT\",\"$NOW_TASK\",\"$what\"" >> $PATH_WORKLOG_CSV
    fi


    tac $PATH_WORKLOG_CSV | head -n 10
}

function now(){
    echo "NOW_CLIENT: $NOW_CLIENT"
    echo "NOW_PROJECT: $NOW_PROJECT"
    echo "NOW_TASK: $NOW_TASK"
    tac $PATH_WORKLOG_CSV | head -n 5
}

function prjhere(){ 
    echo 'export PATH_PROJECT="'$PWD'"' >> ~/.localrc; 
    export PATH_PROJECT=$PWD 
}
