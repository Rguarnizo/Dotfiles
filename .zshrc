export ZSH=$HOME/.oh-my-zsh

export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

#Theme
ZSH_THEME=""

#Plugins
plugins=(git fast-syntax-highlighting   zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#Star Ship
eval "$(starship init zsh)"
