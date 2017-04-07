export PS1
PS1="
\[\033[01;32m\]\u \[\033[0m\]at \[\033[01;33m\]\h \[\033[0m\]in \[\033[01;36m\]\w\[\033[0m\]\[\033[01;35m\]\$(__git_ps1)
\[\033[01;37m\]> \[\033[00m\]"

source ~/git-flow-completion.bash
source ~/go-completion.bash
source ~/rabbitmqadmin-completion.d
source ~/completion.bash

alias gitwary='git st | grep -v "\.php\|\.txt\|\.gif\|\.png\|\.css\|\.js\|\.jpg\|\.gitignore\|\.xml\|\.html\|\.ico\|\.config\|\.snp"'
alias gitlogtoday='git log --pretty="%an %s" --since="0am"'

alias gitnewbranch='~/bash/gitnewbranch.sh'
alias gitmultipull='~/bash/gitmultipull.sh'
alias gitmultiprune='~/bash/gitmultiprune.sh'
alias gittmp='~/bash/gittmp.sh'
alias mysqlbackup='~/bash/mysqlbackup.sh'
alias mysqlbackup_up='~/bash/mysqlbackup_up.sh'
alias projectsbackup='~/bash/projectsbackup.sh'
alias projectsbackup_up='~/bash/projectsbackup_up.sh'
alias cdsublimesnippets='cd "d:/Dropbox/Программы/#Portable/Sublime Text Build 3065 x64/Data/Packages/User/Snippets/sublime-snippets"'
alias gitpush='git push'
alias githist='git hist'
alias gitdiffcached='git diff --cached'
alias gitcim='git ci -m'
alias gitaddanddiff='git add . && gitdiffcached'
alias gits='git st'
alias composer='composer.phar'
alias pu='phpunit.phar'

# "stdout is not a tty" fix
unalias $(alias | grep winpty | cut -d"=" -f1 | cut -d" " -f2)

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

cd ~
CHANGED=$(git status --porcelain)
if [ -n "${CHANGED}" ]; then
	git st
else
	if [ $HOSTNAME = "Panda" ] || [ $HOSTNAME = "Aspire" ]; then
		cdsublimesnippets
		CHANGED=$(git status --porcelain)
		if [ -n "${CHANGED}" ]; then
			git st
		else
			cd /f/projects

			echo ${yellow}'gitmultipull'${reset}
			gitmultipull

			echo ${yellow}'gitmultiprune'${reset}
			gitmultiprune
		fi
	elif [ $HOSTNAME = "Dell" ]; then
		cd /d/Anton/repository/
	fi
fi
