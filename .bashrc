export PS1
PS1="
\[\033[01;32m\]\u \[\033[0m\]at \[\033[01;33m\]\h \[\033[0m\]in \[\033[01;36m\]\w\[\033[0m\]\[\033[01;35m\]\$(__git_ps1)
\[\033[01;37m\]> \[\033[00m\]"

source ~/git-flow-completion.bash
source ~/go-completion.bash
source ~/rabbitmqadmin-completion.d

alias gitwary='git st | grep -v "\.php\|\.txt\|\.gif\|\.png\|\.css\|\.js\|\.jpg\|\.gitignore\|\.xml\|\.html\|\.ico\|\.config\|\.snp"'
alias gitlogtoday='git log --pretty="%an %s" --since="0am"'

alias gitnewbranch='~/bash/gitnewbranch.sh'
alias gitmultipull='~/bash/gitmultipull.sh'
alias gitmultiprune='~/bash/gitmultiprune.sh'
alias gittmp='~/bash/gittmp.sh'
alias cdsublimesnippets='cd "d:/Dropbox/Программы/#Portable/Sublime Text Build 3065 x64/Data/Packages/User/Snippets/sublime-snippets"'
alias gitaddanddiff='git add . && git diff --cached'
alias gitsubmoduleforeachgitpull='git submodule foreach git pull'

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

cd ~
CHANGED=$(git status --porcelain)
if [ -n "${CHANGED}" ]; then
	git st
else
	if [ $HOSTNAME = "Panda" ]; then
		cdsublimesnippets
		CHANGED=$(git status --porcelain)
		if [ -n "${CHANGED}" ]; then
			git st
		else
			cd /f/projects

			echo ${green}'gitmultipull'${reset}
			gitmultipull

			echo ${green}'gitmultiprune'${reset}
			gitmultiprune
		fi
	elif [ $HOSTNAME = "Dell" ]; then
		cd /d/Антон/repository/
	fi
fi
