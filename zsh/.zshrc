# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Load Antigen
source "$HOME/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

[ -s "/Users/jwyce/.bun/_bun" ] && source "/Users/jwyce/.bun/_bun"

export DOT=$HOME/.dotfiles
export CONFIG=$HOME/.config
export NVIM_LUA=$DOT/nvim/lua/jwyce
export ZSHRC=$DOT/.zshrc
export BREWFILE=$DOT/Brewfile
export BIN=$DOT/bin/scripts
export PATH="$BIN:$PATH"
export STARSHIP_CONFIG=$DOT/starship.toml
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"


eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(opam env --switch=4.14.1)"

# Enable vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^r' _atuin_search_widget
bindkey -s ^f "tmux-sessionizer\n"

# aliases
alias c='clear'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls='eza --icons'
alias find='fd'
alias ps='procs'
alias grep='rg'
alias lg='lazygit'
alias vim='nvim'
alias python='python3'
alias pip='pip3'
alias yolo="git push origin master --force --no-verify"
alias f='fuck'
alias kc='kubectl'
alias xsc='pbcopy'
alias my_ip="ifconfig | awk '/inet /&&!/127.0.0.1/{print \$2;exit}'"
alias rm_dangling_links='rm -- *(-@D)'

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'

source "$DOT/.work"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
