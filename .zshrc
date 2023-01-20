# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Load Antigen
source "$HOME/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export DOT=$HOME/.dotfiles
export CONFIG=$HOME/.config
export NVIM_LUA=$DOT/nvim/lua/jwyce
export ZSHRC=$DOT/.zshrc
export BREWFILE=$DOT/Brewfile
export BIN=$DOT/bin/scripts
export PATH="$BIN:$PATH"
export STARSHIP_CONFIG=$DOT/starship.toml
export BAT_THEME="gruvbox-dark"

eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(fnm env --use-on-cd)"

# Enable vi mode
bindkey -v

# rebind atuin
ATUIN_NOBIND=1 eval "$(atuin init zsh)"
bindkey '^r' _atuin_search_widget

# aliases
alias rimraf='rm -rf'
alias code="open $1 -a \"Visual Studio Code\""
alias c='clear'
alias l='exa -la'
alias lg='lazygit'
alias vim='nvim'
alias vi='nvim'
alias python='python3'
alias pip='pip3'
alias yolo="git push origin master --force --no-verify"
alias f='fuck'
alias kc='kubectl'
alias clean_symln='rm -- *(-@D)'

# cargo aliases
alias cr="cargo run"
alias ca="cargo add"
alias cn="cargo new"
alias ct="cargo test"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
