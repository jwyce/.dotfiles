# Load Antigen
source "$HOME/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

[ -s "/Users/jwyce/.bun/_bun" ] && source "/Users/jwyce/.bun/_bun"

export DOT=$HOME/.dotfiles
export CONFIG=$HOME/.config
export LOCAL=$HOME/.local
export EDITOR=nvim
export NVIM_LUA=$DOT/nvim/lua/jwyce
export ZSHRC=$DOT/.zshrc
export BREWFILE=$DOT/Brewfile
export STARSHIP_CONFIG=$DOT/starship.toml
export BUN_INSTALL="$HOME/.bun"
export BIN=$DOT/bin/scripts
export PATH="$BIN:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH=/Users/jwyce/.opencode/bin:$PATH
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"
eval "$(opam env --switch=5.4.0)"

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
alias ps='procs'
alias lg='lazygit'
alias vim='nvim'
alias python='python3'
alias pip='pip3'
alias yolo="git push origin master --force --no-verify"
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

. "$HOME/.local/bin/env"
