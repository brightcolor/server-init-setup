alias wp='sudo -u $(stat -c '%U' index.php) /usr/local/bin/wp'
alias mcv='mc /var/www/$1'
alias mkdir="mkdir -p"
alias ls="ls -hF --color=auto"
alias ll="ls -lahF --color=auto"
alias lsl="ls -lhF --color=auto"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"
function email() {
	echo $3 | mutt -s $2 $1
}
