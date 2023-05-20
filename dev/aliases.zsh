alias ec="export EDITOR=code"
alias ev="export EDITOR=vim"
alias es="export EDITOR=phpstorm"
alias ,t="~/,t"
alias ,t2="~/,t2"
alias ,t2e="e ~/,t2"
alias ,te="e ~/,t"
alias ,l="~/,l"
alias ,l2="~/,l2"
alias ,l2e="e ~/,l2"
alias ,le="e ~/,l"
alias ,py="./,py"

# break long cli into multiple lines (useful for aws)
alias clibreak="sed -i.bak 's/ -- \\\\\n --/g'"
alias scratchpy="mkdir -p ~/scratch/py && cd ~/scratch/py && e ./,py.py"
alias scratcsql="mkdir -p ~/scratch/sql && cd ~/scratch/sql && e ./,sql.sql"
alias scratchp="mkdir -p ~/scratch/php && cd ~/scratch/php && e ./,php.php"
alias ,up="prj && ./.devup.sh"
alias ,dwn="prj && ./.devdown.sh"

#paths
alias repos="cd ~/repos"
alias apps="cd ~/apps"

alias u+x="chmod u+x"
