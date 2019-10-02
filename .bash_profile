test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

cd ~
CHANGED=$(git status --porcelain)
if [ -n "${CHANGED}" ]; then
    git st
else
    if [ $HOSTNAME = "Panda" ]; then
        cd /h/projects

        # echo ${yellow}'gitmultipull'${reset}
        # gitmultipull
        # echo ${yellow}'gitmultiprune'${reset}
        # gitmultiprune
    elif [ $HOSTNAME = "Aspire" ]; then
        cd /f/projects

        # echo ${yellow}'gitmultipull'${reset}
        # gitmultipull
        # echo ${yellow}'gitmultiprune'${reset}
        # gitmultiprune
    fi
fi
