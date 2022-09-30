if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
