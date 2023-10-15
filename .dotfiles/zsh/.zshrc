export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sonicradish"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="eza -a --icons --group-directories-first"
alias cls="clear" # Average Windows user
alias bat="batcat"
