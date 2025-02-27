eval "$(/opt/homebrew/bin/brew shellenv)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
#zinit load zpm-zsh/ls

# Add in snippets
zinit snippet OMZL::completion.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.json)"
fi


# History
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -las type --color=always --icons -F --no-permissions $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -las type --color=always --icons -F --no-permissions $realpath'
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:*' switch-group '<' '>'

# Aliases
alias ls='ls --color'
alias k='kubectl'
alias gc='czg ai -N=5'

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(fzf --zsh)"

# Env variables
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export DOPPLER_TOKEN=$(doppler configure get token --plain)
export EDITOR="vim"
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
. "$HOME/.cargo/env"


export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH=$PATH:/opt/homebrew/bin:$HOME/go/bin:/opt/homebrew/opt/postgresql@17/bin:$HOME/gwctl/bin

# Google Cloud SDK.
[[ -f "$HOME"/google-cloud-sdk/path.zsh.inc ]] && source "$HOME"/google-cloud-sdk/path.zsh.inc
[[ -f "$HOME"/google-cloud-sdk/completion.zsh.inc ]] && source "$HOME"/google-cloud-sdk/completion.zsh.inc

fpath+=~/.zfunc; autoload -Uz compinit; compinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

[[ -f "$HOME"/.zshrc.local ]] && source "$HOME"/.zshrc.local

# Use fzf for history search
if command -v fzf >/dev/null 2>&1; then
    bindkey '^r' fzf-history-widget
fi
