function git_parse_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function get_desc()
{
    [[ -f ./.desc ]] && cat .desc
}

function ltu()
{
    ls -la /tmp | grep $USER | grep tmp | awk '{print $9}'
}

function cltu()
{
    ltu | wc -l
}

function cltmp()
{
    for i in $(ls -la /tmp | grep $USER | grep tmp | awk '{print $9}')
    do
        rm -rf $i
    done
}

function fndx()
{
    if [[ $# -ne 2 ]]
    then
        echo "Needs 2 args"
        return
    fi
    find . -name $1 -exec $2 {} \;
}

function 2h()
{
    if [[ $# -ne 1 ]]
        then
        echo "Needs 1 arg"
        return
    fi
    printf "0x%x\n" $(($1))
}

function 2d()
{
    if [[ $# -ne 1 ]]
        then
        echo "Needs 1 arg"
        return
    fi
    printf "%d\n" $(($1))
}

function 2c()
{
    if [[ $# -ne 1 ]]
        then
        echo "Needs 1 arg"
        return
    fi
    printf "%C\n" $(($1))
}

function agent()
{
    eval $(ssh-agent)
    for key in $(ls ~/.ssh/id* | grep -v "\.pub")
    do
        ssh-add $key
    done
}
