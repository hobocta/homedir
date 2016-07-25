export PS1
PS1="
\[\033[01;32m\]\u \[\033[0m\]at \[\033[01;33m\]\h \[\033[0m\]in \[\033[01;36m\]\w\[\033[0m\]\[\033[01;35m\]\$(__git_ps1)
\[\033[01;37m\]> \[\033[00m\]"

source ~/git-flow-completion.bash
source ~/go-completion.bash

alias gitwary='git st | grep -v "\.php\|\.txt\|\.gif\|\.png\|\.css\|\.js\|\.jpg\|\.gitignore\|\.xml\|\.html\|\.ico\|\.config\|\.snp"'
alias gitlogtoday='git log --pretty="%s" --since="0am"'

alias gitnewbranch='~/bash/gitnewbranch.sh'
alias gitmultipull='~/bash/gitmultipull.sh'
alias gitmultiprune='~/bash/gitmultiprune.sh'
alias gittmp='~/bash/gittmp.sh'
alias cdsublimesnippets='cd "d:/Dropbox/Программы/#Portable/Sublime Text Build 3065 x64/Data/Packages/User/Snippets/sublime-snippets"'

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

			echo 'gitmultipull:'
			gitmultipull

			echo 'gitmultiprune:'
			gitmultiprune
		fi
	elif [ $HOSTNAME = "DELL" ]; then
		cd /d/Антон/repository/
	fi
fi
