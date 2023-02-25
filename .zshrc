export ZSH=$HOME/.oh-my-zsh


export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_19_HOME=$(/usr/libexec/java_home -v19)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)




alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java19='export JAVA_HOME=$JAVA_19_HOME'
export ANDROID_SDK_ROOT=~/Library/Android/sdk
java19 

export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

#Theme
ZSH_THEME=""

#Plugins
plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#Star Ship
eval "$(starship init zsh)"
