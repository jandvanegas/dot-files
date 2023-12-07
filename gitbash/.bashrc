source ~/.git_aliases.sh
source ~/.python_aliases.sh
alias p='python -m' 
alias activate='source .venv/Scripts/activate'
alias poetry='/c/Users/JV0054/my-envs/poetry/Scripts/python -m pip poetry'

# alias cruft="${HOME}my-envs/cruft/Scripts/python -m cruft"
# alias cookiecutter="${HOME}my-envs/cruft/Scripts/python -m cookiecutter"
for py_env in $(ls ${HOME}/my-envs/311 | tr -d '/');
do
    alias ${py_env}="winpty ${HOME}/my-envs/311/${py_env}/Scripts/python -m ${py_env}";
done
# alias poetry="${HOME}my-envs/311/poetry/Scripts/python -m poetry"
# Key bindings, up/down arrow searches through history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
export HISTSIZE=10000
export HISTFILESIZE=10000
#export PYENV="$HOME.pyenv/pyenv-win"
#export PYENV_ROOT="$HOME.pyenv/pyenv-win"
#export PYENV_HOME="$HOME.pyenv/pyenv-win"
#export PATH="$PATH:$HOME/.pyenv/pyenv-win/bin:$HOME/.pyenv-win/shims"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
LS_COLORS=$LS_COLORS:'di=1;97;40:ow=1;97;40'
export LS_COLORS
export TERM=cygwin
export TERM=eterm-256color
alias tf="/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2019/Community/Common7/IDE/CommonExtensions/Microsoft/TeamFoundation/Team\ Explorer/TF.exe"