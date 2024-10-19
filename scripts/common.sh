# some common functions/aliases for routine tasks
alias ll='ls -alF --color=auto'
alias ls='ls -CFA --color=auto'
alias c='clear'

function mkcd() {
  mkdir -vp "$1" && cd "$1"
}