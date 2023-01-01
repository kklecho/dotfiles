function precommitrundir() {  [[ -d $1 ]] && git ls-files -- $1 | xargs pre-commit run --files }
