function fn_gamerup() {
  if [[ -z "$PATH_GAMER" ]]
  then
    echo "PATH_GAMER must be set"; 
  else
    (cd $PATH_GAMER; vagrant up)
  fi 
}
