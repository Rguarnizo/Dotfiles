# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
export AWS_ACCOUNT_ID=992382426608
export AWS_REGION=us-east-1
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

PATH=/opt/homebrew/bin:$PATH

# ZSH_THEME="powerlevel10k/powerlevel10k"


export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'
java8


plugins=(
    git 
    fast-syntax-highlighting 
    zsh-autosuggestions 
    zsh-vi-mode
    )


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
