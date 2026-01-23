# Dotfiles

A comprehensive, automated dotfiles management system for macOS development environments.

## Quick Start

```bash
git clone https://github.com/jwyce/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./dot init
```

Options: `--skip-font`, `--skip-ssh`

## Structure

```
~/.dotfiles/
├── dot                   # CLI tool
├── home/                 # Stowed to ~ (symlinks)
│   ├── .agents/          # AI agent skills
│   ├── .config/
│   │   ├── zsh/          # Shell (via ZDOTDIR)
│   │   ├── nvim/         # Neovim (lazy.nvim, native LSP)
│   │   ├── git/          # Git + work includeIf
│   │   ├── jj/           # Jujutsu VCS
│   │   ├── tmux/         # Tmux
│   │   ├── opencode/     # OpenCode AI
│   │   ├── ghostty/      # Terminal
│   │   ├── starship.toml # Prompt
│   │   └── ...
│   └── .local/bin/       # Scripts
├── packages/Brewfile     # Homebrew packages
├── .tmux/                # gpakosz/tmux submodule
└── fonts/                # Custom fonts
```

## The `dot` CLI

| Command | Description |
|---------|-------------|
| `dot init` | Full setup (brew, stow, languages, SSH, fonts) |
| `dot update` | Pull latest + brew upgrade + restow |
| `dot doctor` | Health checks and diagnostics |
| `dot stow` | Re-create symlinks |
| `dot brew` | Install from Brewfile |
| `dot skills` | Sync agent skills to dotfiles |
| `dot edit` | Open dotfiles in editor |

### What `dot init` Does

1. Installs Homebrew
2. Installs packages from Brewfile
3. Stows `home/` to `~`
4. Links tmux submodule
5. Ensures ZDOTDIR in `~/.zshenv`
6. Installs: OpenCode, Antigen, Rust, OCaml, Node (fnm), Bun
7. Generates SSH key (optional)
8. Installs fonts (optional)

## Key Configurations

- **Neovim** — Lua config, lazy.nvim, native LSP (0.11+), per-plugin files
- **Zsh** — Antigen plugin manager, XDG-compliant via ZDOTDIR
- **Git** — SSH commit signing, conditional work email via `includeIf`
- **Jujutsu** — SSH signing, work scope, custom aliases and revsets
- **Tmux** — gpakosz/.tmux base, custom local overrides
- **Agent Skills** — Managed in `~/.agents/`, synced via `dot skills`

## How Stow Works

Files in `home/` mirror the home directory structure:

```
home/.config/nvim/ → ~/.config/nvim/
home/.agents/      → ~/.agents/
```

Run `dot stow` after making changes.

## Acknowledgements

- [GNU Stow](https://www.gnu.or/software/stow/) for symlink management
- [Homebrew](https://brew.sh/) for package management
- [OpenCode](https://opencode.ai/) for AI assistance
- [dmmulroy/.dotfiles](https://github.com/dmmulroy/.dotfiles) for inspiration for the `dot` CLI and stow-based structure
