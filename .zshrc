if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/terrorblade/.oh-my-zsh"

#git handler function
function shipit(){
	        git commit -a -m "$1"
		    git push
	    }
function run(){
	powershell.exe Start "$1"
}

function gsoft(){
	sudo apt-get install "$1"
}

function remove(){
}

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"


#plugins
plugins=(docker git zsh-autosuggestions shrink-path python ubuntu extract sudo)
source $ZSH/oh-my-zsh.sh
source $(dirname $(gem which colorls))/tab_complete.sh

#aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='colorls -A'
alias ga='git add'
alias cc="clear"
alias gp="git pull"
alias gs="git status"
alias s="sudo"
alias gf="git fetch"
alias lt='colorls -A --tree'
alias update='sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get autoremove'
alias shanrepos='cd /mnt/d/edu/GitRepos'
alias mtech='cd /mnt/d/edu/Mtech2020'
alias b='cd ..'
alias c='cd'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Change ls colours
LS_COLORS="ow=01;36;40" && export LS_COLORS

#make cd use the ls colours
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
