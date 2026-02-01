function fn_bddone(){
    if [ ! -f "${PATH_BRAIN_DUMP_TODAY}" ]; then
        echo "PATH_BRAIN_DUMP_TODAY must be file"
        return 1
    fi
    echo "now:\nnext:\nlater:\n" >> ${PATH_BRAIN_DUMP_DEC_TODAY}
    sed 's/^/  /g' ${PATH_BRAIN_DUMP_TODAY} >> ${PATH_BRAIN_DUMP_DEC_TODAY}
}

function nowcli(){ 
    client=$*

    if [ -z "$client" ]; then
        echo "Client name is required"
        return 1
    fi

    echo 'export NOW_CLIENT="'$client'"' >> ~/.localrc; 
    export NOW_CLIENT=$client 
}

function nowprjtic(){ 
    project=$*

    if [ -z "$project" ]; then
        echo "Project name / epic is required"
        return 1
    fi

    echo 'export NOW_PROJECT_TIC="'$project'"' >> ~/.localrc;
    export NOW_PROJECT_TIC=$project 
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

function nowtic(){ 
    ticket=$*

    if [ -z "ticket" ]; then
        echo "Ticket name is required"
        return 1
    fi

    echo 'export NOW_TICKET="'$ticket'"' >> ~/.localrc;
    export NOW_TICKET=$ticket 
}

function lg(){ 
    # work log
    now=$(date +"%Y-%m-%dT%H:%M:%S")
    what=$*
    des=""

    if [[ ($# -gt 1) && (($1=="adhoc") || ($1=="brk")) ]]; then
        what=$1
        des=$2
    fi

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

    if [ -z "$NOW_TICKET" ]; then
        ticket=""
    else
        ticket=$NOW_TICKET
    fi

    if [ ! -f $PATH_WORKLOG_CSV ]; then
        touch $PATH_WORKLOG_CSV
        echo "date,client,project,task,ticket,what" > $PATH_WORKLOG_CSV
    fi

    if [[ $what == "brk" ]]; then
        echo "$now,BREAK,BREAK,BREAK,BREAK,\"$des\"" >> $PATH_WORKLOG_CSV
        tac $PATH_WORKLOG_CSV | head -n 2
        return 0
    fi

    if [[ $what == "adhoc" ]]; then
        echo "$now,ADHOC,ADHOC,ADHOC,ADHOC,\"$des\"" >> $PATH_WORKLOG_CSV
        tac $PATH_WORKLOG_CSV | head -n 2
        return 0
    fi


    if [ -z "$what" ]; then
        echo "lg brk"
        echo "or lg <what_you_are_doing>"
        echo "or lg"
        tac $PATH_WORKLOG_CSV
    else
        echo "$now,\"$NOW_CLIENT\",\"$NOW_PROJECT\",\"$NOW_TASK\",\"$NOW_TICKET\",\"$what\"" >> $PATH_WORKLOG_CSV
    fi


    tac $PATH_WORKLOG_CSV | head -n 5
}

function now(){
    echo "NOW_CLIENT: $NOW_CLIENT"
    echo "NOW_PROJECT_TIC: $NOW_PROJECT_TIC"
    echo "NOW_PROJECT: $NOW_PROJECT"
    echo "NOW_TASK: $NOW_TASK"
    echo "NOW_TICKET: $NOW_TICKET"
    tac $PATH_WORKLOG_CSV | head -n 5
}

function prjhere(){ 
    echo 'export PATH_PROJECT="'$PWD'"' >> ~/.localrc; 
    export PATH_PROJECT=$PWD 
}

function bm(){ 
    [[ -z $1 ]] && echo "Usage bm <bookmark_code>" && return 1

    echo 'alias g'$1'="cd '$PWD'"' >> ~/.localrc; 
    alias g$1="cd $PWD"
}


function kl(){ catchup.py 'kl' "$*"; }
function klr(){ catchup.py 'klr' "$*"; }
function oa(){ catchup.py 'oa' "$*"; }
function rl(){ catchup.py 'rl' "$*"; }
