export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
