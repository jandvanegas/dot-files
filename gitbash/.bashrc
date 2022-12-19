source ~/.git_aliases.sh
source ~/.python_aliases.sh
alias p='python -m' 
alias activate='source .venv/Scripts/activate'
# Key bindings, up/down arrow searches through history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
export HISTSIZE=10000
export HISTFILESIZE=10000
