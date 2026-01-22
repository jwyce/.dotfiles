source "$HOME/antigen.zsh"

antigen init "$ZDOTDIR/.antigenrc"

[ -s "/Users/jwyce/.bun/_bun" ] && source "/Users/jwyce/.bun/_bun"

export DOT=$HOME/.dotfiles
export CONFIG=$HOME/.config
export LOCAL=$HOME/.local
export EDITOR=nvim
export NVIM_LUA=$CONFIG/nvim/lua/jwyce
export ZSHRC=$ZDOTDIR/.zshrc
export BREWFILE=$DOT/packages/Brewfile
export BUN_INSTALL="$HOME/.bun"
export BIN=$LOCAL/bin/scripts
export RIPGREP_CONFIG_PATH=$CONFIG/ripgrep/config
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

bindkey -v
bindkey '^r' _atuin_search_widget
bindkey -s ^f "tmux-sessionizer\n"

alias c='clear'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls='eza --icons'
alias ps='procs'
alias lg='lazygit'
alias ljj='lazyjj'
alias vim='nvim'
alias oc='opencode'
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

FZF_TAB_GROUP_COLORS=(
    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS
zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' query-string ''

autoload -U compinit && compinit
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
source <(carapace _carapace)
compdef _tmux tmux

. "$HOME/.local/bin/env"
