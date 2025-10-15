function fn_case_new () {
    [ -z $1 ] && echo "provide codename for the case" && return
    
    now=$(date +"%Y-%m-%dT%H:%M:%S")
    what=$*
    des=""
    casedir=$PATH_ADMIN/cases/$(date +"%Y%m%d")_${1}
    mkdir -p $PATH_ADMIN/cases/arch 2>/dev/null
    mkdir -p $PATH_ADMIN/cases/$(date +"%Y%m%d")_${1} 2>/dev/null
    touch ${casedir}/tmp.sql
    echo "$*" > ${casedir}/0.yaml
    e ${casedir}/0.yaml
}
