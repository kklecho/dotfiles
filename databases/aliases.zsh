#databasess
alias tdbm1db="mysql --defaults-group-suffix=_tdbm1"
alias tdbs1db="mysql --defaults-group-suffix=_tdbs1"
alias mydump="mysqldump $1 | gzip > ~/dumps/$1.sql.gz"
