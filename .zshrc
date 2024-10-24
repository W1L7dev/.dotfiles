# ---- INSTANT PROMPT ----
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- TMUX ----
if [ -z "$TMUX" ]; then
  exec tmux new-session
fi

# ---- ZINIT ----
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}"/zinit.zsh

# ---- POWERLEVEL10k ----
zinit ice depth=1; zinit light romkatv/powerlevel10k

# ---- PLUGINS ----
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting

# ---- SNIPPETS ----
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::fzf
zinit snippet OMZP::kitty
zinit snippet OMZP::tmux
zinit snippet OMZP::vscode
zinit snippet OMZP::zoxide

# ---- KEYBINDINGS ----
bindkey "^f" autosuggest-accept
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# ---- HISTORY ----
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erasedups

setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ---- COMPLETION ----
autoload -Uz compinit && compinit

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no

# ---- INTEGRATIONS ----
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# ---- FZF ----
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefic --exclude .git"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

source ~/Repos/fzf-git/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview \"$show_file_or_dir_preview\""
export FZF_ALT_C_OPTS="--preview \"eza --tree --color=always {} | head -200\""

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview "eza --tree --color=always {} | head -200" "$@" ;;
    export|unset) fzf --preview "eval \"echo \${}\""         "$@" ;;
    ssh)          fzf --preview "dig {}"                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ---- ALIASES ----
alias tree="eza --icons --color --recurse --tree --all --git-ignore --level=2"
alias ls="eza --color --long --git --no-filesize --icons --no-time --no-user --no-permissions --all"
alias cls="clear"
alias py="python3"
alias pip="pip3"
alias neofetch="neofetch --ascii ~/.dotfiles/.config/neofetch/arch"

# ---- BAT ----
bat cache --build

# ---- THEFUCK ----
eval $(thefuck --alias)

# ---- STARTUP ----
clear
neofetch

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
cd ~
