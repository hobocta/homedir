export PS1
PS1="
\[\033[01;32m\]\u \[\033[0m\]at \[\033[01;33m\]\h \[\033[0m\]in \[\033[01;36m\]\w\[\033[0m\]\[\033[01;35m\]\$(__git_ps1)
\[\033[01;37m\]> \[\033[00m\]"

source ~/git-flow-completion.bash
source ~/go-completion.bash

alias tmp1="mkdir tmp && git log -1 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp2="mkdir tmp && git log -2 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp3="mkdir tmp && git log -3 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp4="mkdir tmp && git log -4 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp5="mkdir tmp && git log -5 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp6="mkdir tmp && git log -6 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp7="mkdir tmp && git log -7 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp8="mkdir tmp && git log -8 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp9="mkdir tmp && git log -9 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp10="mkdir tmp && git log -10 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp11="mkdir tmp && git log -11 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp12="mkdir tmp && git log -12 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp13="mkdir tmp && git log -13 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp14="mkdir tmp && git log -14 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"
alias tmp15="mkdir tmp && git log -15 --name-only --no-commit-id --pretty=\"format:\" | sort | uniq | xargs -I % cp --parents % tmp"

alias gitwary='git st | grep -v "\.php\|\.txt\|\.gif\|\.png\|\.css\|\.js\|\.jpg\|\.gitignore\|\.xml\|\.html\|\.ico\|\.config\|\.snp"'
alias gitlogtoday='git log --pretty="%s" --since="0am"'
alias cdsublimesnippets='cd "d:/Dropbox/Программы/#Portable/Sublime Text Build 3065 x64/Data/Packages/User/Snippets/sublime-snippets"'
alias gitnewbranch='c:/Users/Anton/bash/gitnewbranch.sh'
alias gitmultipull='c:/Users/Anton/bash/gitmultipull.sh'
alias gitmultiprune='c:/Users/Anton/bash/gitmultiprune.sh'

cd ~
CHANGED=$(git status --porcelain)
if [ -n "${CHANGED}" ]; then
	git st
else
	if [ $HOSTNAME = "PANDA" ]; then
		cdsublimesnippets
		CHANGED=$(git status --porcelain)
		if [ -n "${CHANGED}" ]; then
			git st
		else
			echo 'gitmultipull:'
			gitmultipull
			echo 'gitmultiprune:'
			gitmultiprune
			cd /f/projects
		fi
	elif [ $HOSTNAME = "DELL" ]; then
		cd /d/Антон/repository/
	fi
fi
