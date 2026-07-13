alias b="cd .."
alias bb="cd ../../"
alias bbb="cd ../../../"
alias bbbb="cd ../../../../"
alias sbrc="source ~/.bashrc"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias l="ls -l"
alias la="ls -al"
alias lrt="ls -lrt"
alias lart="ls -lart"
alias lh="ls -lh"
alias fnd="find . -name"

alias home='cd ~'
alias dot='cd ~/dotfiles'

alias reload='exec bash'
alias sb='source ~/.bashrc'

#Package Management
alias update='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'
alias remove='sudo apt remove'

#System
alias cpu='lscpu'
alias mem='free -h'
alias dfh='df -h'

alias now='date "+%Y-%m-%d %H:%M:%S"'

alias path='echo "$PATH" | tr ":" "\n"'

alias ports='ss -tulanp'

alias myip='curl -fsSL ifconfig.me'

alias pingg='ping google.com'

#Python Server
alias serve='python3 -m http.server 8000'

#Git
alias gs='git status -sb'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate --all'
alias lg='lazygit'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gbd='git branch -d'
alias gbl='git blame -w'
alias gst='git stash'
alias gcp='git cherry-pick'

#History
alias h='history'
alias hg='history | grep'

#Downloads
cpw() {
    cp "/mnt/c/Users/ajjai/Downloads/$1" .
}

cpdw() {
    cp "$1" /mnt/c/Users/ajjai/Downloads/
}

cdw() {
    cd /mnt/c/Users/ajjai/Downloads/
}

alias dbg_docker='docker run \
        --privileged \
        -w "$(pwd)" \
        -u $(id -u):$(id -g) \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v ~/.ssh:/home/${USER}/.ssh:ro \
        -v ~/dockerfiles/fw2_bashrc:/home/${USER}/.bashrc \
        -v ~/.gitconfig:/etc/gitconfig \
        -v ~/projects/wpan_git/:/projects/wpan_git \
        -v /tools/oss:/tools/oss \
        -v ~/:/home/${USER} \
        -it bt-firmware-build '
alias toolchain="export PATH=~/$USER/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/bin:$PATH"
