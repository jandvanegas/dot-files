if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Alias
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias dc='docker-compose'
alias activate='source venv/bin/activate'

# Nvim and also used in tmux for scroll navigation
export VISUAL=nvim
export EDITOR="$VISUAL"

# If cs (cousier for scala) is available
if [ -d "$HOME/.local/share/coursier/bin/" ]; then
  export PATH="$HOME/.local/share/coursier/bin/:$PATH"
  eval $(cs java --jvm adopt:1.11 --env)
fi

# fzf
distribution=$(cat /etc/os-release | grep -e '^ID=')
if [ $distribution = "ID=fedora" ]; then
  source /usr/share/fzf/shell/key-bindings.zsh
else
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv" 
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [ -d "$PYENV_ROOT/bin/" ]; then
  eval "$(pyenv init -)" 
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
