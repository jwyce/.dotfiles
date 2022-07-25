# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"

# Load Antigen
source "$HOME/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(fnm env --use-on-cd)"

export BAT_THEME="gruvbox-dark"

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
alias vim='nvim'
alias vi='nvim'
alias python='python3'
alias pip='pip3'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'
alias yolo="git push origin master --force --no-verify"

# npm aliases
alias nr="npm run"
alias nci="npm ci"
alias ni="npm i"
alias nid="npm i -D"
alias nrm="npm rm"
alias nt="npm run test"

# pnpm aliases
alias p="pnpm"
alias pi="pnpm install"
alias pa="pnpm add"
alias pr="pnpm remove"
alias pad="pnpm add -D"
alias pt="pnpm test"

# yarn aliases
alias y="yarn"
alias ya="yarn add"
alias yr="yarn remove"
alias yad="yarn add -D"
alias yt="yarn test"

# cargo aliases
alias cr="cargo run"
alias ca="cargo add"
alias cn="cargo new"
alias ct="cargo test"

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
