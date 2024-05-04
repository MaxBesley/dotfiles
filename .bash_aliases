alias update='sudo apt update'
alias upgrade='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'

alias ls='ls --color=auto --group-directories-first'
alias la='ls -A'                       # list all
alias ll='ls -alhGg --classify'        # list long
alias lt='ls -I ".git" -TA --level=2'  # list tree (uses eza)
alias l='ls'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias desktop='cd ~/Desktop'

alias aliases='nvim ~/.bash_aliases'
alias bashrc='nvim ~/.bashrc'
alias sbashrc='source ~/.bashrc'
alias path='echo -e ${PATH//:/\\n}'

alias diskspace='du -S | sort -n -r | more'

alias please='sudo $(history -p !!)'

alias vi='nvim'
alias vim='vim'
alias vimrc='vim ~/.vimrc'
alias nvimrc='cd ~/.config/nvim'

alias gadd='git add'
alias gcomm='git commit -m'
alias gpush='git push'
alias gclone='git clone'
alias gdiff='git diff'
alias gstat='git status'
alias glog='git log'

alias clr='clear'
alias more='less'
alias sudo='sudo '
alias shutdown='sudo shutdown'
alias reboot='sudo roboot'
alias quit='exit'

alias ports='ss -tulanp'

alias py=$(which python3.11)
