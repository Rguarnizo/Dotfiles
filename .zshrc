export ZSH=$HOME/.oh-my-zsh

autoload -Uz compinit && compinit

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_19_HOME=$(/usr/libexec/java_home -v19)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)


alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java19='export JAVA_HOME=$JAVA_19_HOME'

java11 


export ANDROID_SDK_ROOT=~/Library/Android/sdk


export PATH=$HOME/.pub-cache/bin:$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

#Theme
ZSH_THEME=""

#Plugins
plugins=(git fast-syntax-highlighting zsh-autosuggestions zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

#Star Ship
eval "$(starship init zsh)"
