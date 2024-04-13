alias pubkey="cat ~/.ssh/*.pub"

alias cl='clear'
alias c="clear"
alias pg='ps -ef | grep'
alias lj='jobs'

alias reload!='. ~/.zshrc'
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Kubernetes
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgc="kubectl get configmaps"
alias kgl="kubectl logs"
alias kdp="kubectl describe pod"
alias kge="kubectl get events --sort-by='{.lastTimestamp}'"
