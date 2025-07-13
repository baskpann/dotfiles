alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias sbrc="source ~/.bashrc"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias l="ls -l"
alias la="ls -al"
alias lrt="ls -lrt"
alias lart="ls -lart"
alias lh="ls -lh"
alias fnd="find . -name"
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
