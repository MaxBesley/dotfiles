alias update='sudo apt update'
alias upgrade='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'

alias ls='ls --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -alhFGg'
alias l='ls'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias home='cd ~'
alias desktop='cd ~/Desktop'
alias bash_aliases='nvim ~/.bash_aliases'
alias bashrc='nvim ~/.bashrc'
alias sbashrc='source ~/.bashrc'
alias path='echo $PATH'

alias diskspace='du -S | sort -n -r | more'

alias please='sudo $(history -p !!)'

alias vi='nvim'
alias vim='vim'
alias nvimrc='cd ~/.config/nvim'

alias gadd='git add'
alias gcomm='git commit -m'
alias gpush='git push'
alias gclone='git clone'
alias gdiff='git diff'
alias gstat='git status'
alias glog='git log'

alias more='less'
alias sudo='sudo '
alias shutdown='sudo shutdown'
alias reboot='sudo roboot'
alias quit='exit'

alias ports='ss -tulanp'

alias py=$(which python3.11)
