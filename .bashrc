export PS1
PS1="
\[\033[01;32m\]\u \[\033[0m\]at \[\033[01;33m\]\h \[\033[0m\]in \[\033[01;36m\]\w\[\033[0m\]\[\033[01;35m\]\$(__git_ps1)
\[\033[01;37m\]> \[\033[00m\]"

source ~/git-flow-completion.bash
source ~/go-completion.bash
source ~/rabbitmqadmin-completion.d
source ~/completion.bash
source ~/docker-completion.bash

alias gitwary='git st | grep -v "\.php\|\.txt\|\.gif\|\.png\|\.css\|\.js\|\.jpg\|\.gitignore\|\.xml\|\.html\|\.ico\|\.config\|\.snp"'
alias gitlogtoday='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short --since="0am"'

alias gitnewbranch='~/bash/gitnewbranch.sh'
alias gitmultipull='~/bash/gitmultipull.sh'
alias gitmultiprune='~/bash/gitmultiprune.sh'
alias gittmp='~/bash/gittmp.sh'
alias gitdiffcachedtmp='~/bash/gitdiffcachedtmp.sh'
alias mysqlbackup='~/bash/mysqlbackup.sh'
alias mysqlbackup_up='~/bash/mysqlbackup_up.sh'
alias projectsbackup='~/bash/projectsbackup.sh'
alias projectsbackup_up='~/bash/projectsbackup_up.sh'
alias gitpush='git push'
alias githist='git hist'
alias gitdiffcached='git diff --cached'
alias gitcim='git ci -m'
alias gitaddanddiff='git add . && gitdiffcached'
alias gits='git st'
alias gs='git st'
alias gh='git hist'
alias gitsu='git submodule update'
alias gsu='git submodule update'
alias gp='git pull'
alias gpsus='git pull && git submodule update && git st'
alias gps='git push'
gsr(){
git symbolic-ref HEAD refs/heads/"$1"
}
alias composer='composer.phar'
alias phpunit='php ~/bin/phpunit-5.7.27.phar'
alias pu='phpunit'
alias phpcs='php72 ~/bin/php-cs-fixer-v2.phar'
alias pc='phpcs'
alias php53='/f/OSPanel/modules/php/PHP-5.3/php.exe'
alias php54='/f/OSPanel/modules/php/PHP-5.4/php.exe'
alias php55='/f/OSPanel/modules/php/PHP-5.5/php.exe'
alias php55x64='/f/OSPanel/modules/php/PHP-5.5-x64/php.exe'
alias php56='/f/OSPanel/modules/php/PHP-5.6/php.exe'
alias php56x64='/f/OSPanel/modules/php/PHP-5.6-x64/php.exe'
alias php70x32='/f/OSPanel/modules/php/PHP-7.0/php.exe'
alias php70='/f/OSPanel/modules/php/PHP-7.0-x64/php.exe'
alias php71x32='/f/OSPanel/modules/php/PHP-7.1/php.exe'
alias php71='/f/OSPanel/modules/php/PHP-7.1-x64/php.exe'
alias php72x32='/f/OSPanel/modules/php/PHP-7.2/php.exe'
alias php72='/f/OSPanel/modules/php/PHP-7.2-x64/php.exe'
alias python='winpty python'
alias rabbitmqctl='rabbitmqctl.bat'
alias hg='"/c/Program Files/TortoiseHg/hg.exe"'

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`
