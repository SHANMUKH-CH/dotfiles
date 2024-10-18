# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit if not exists
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load zinit
source "$ZINIT_HOME/zinit.zsh"

#plugins=(git zsh-autosuggestions zsh-syntax-highlighting aws ansible azure dnf gh gitignore kubectl yum terraform rust)

# Add in Powerlevel10k: https://github.com/romkatv/powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins:
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search

# Add in snippets plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::kubectl
zinit snippet OMZP::terraform
zinit snippet OMZP::docker-compose
zinit snippet OMZP::helm
zinit snippet OMZP::kubectx
zinit snippet OMZP::minikube
zinit snippet OMZP::gcloud
zinit snippet OMZP::aws
zinit snippet OMZP::azure
zinit snippet OMZP::ansible
zinit snippet OMZP::npm
zinit snippet OMZP::nvm
zinit snippet OMZP::python
zinit snippet OMZP::gitignore
zinit snippet OMZP::yum
zinit snippet OMZP::dnf
zinit snippet OMZP::command-not-found
zinit snippet OMZP::vagrant
zinit snippet OMZP::virtualenv

# Automatically load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# some common functions/aliases. TODO: move to a common sh file
alias ll='ls -alF --color=auto'
alias ls='ls -CFA --color=auto'
alias c='clear'

function mkcd() {
  mkdir -vp "$1" && cd "$1"
}

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"