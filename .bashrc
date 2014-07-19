# this comment is a test, to make sure git commit is working

export EDITOR=vim
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'''
export PS1="[\u][\h][\w] \\$ "


dirsize () {
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xjf $1    ;;
           *.tar.gz)    tar xzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.tar.xz)    tar -xJfv $1   ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xf $1     ;;
           *.tbz2)      tar xjf $1    ;;
           *.tgz)       tar xzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
   echo "'$1' is not a valid file!"
   fi
 }

shortcuts () {
	echo "dirsize"
	echo "extract"
	echo "agi - sudo apt-get install"
	echo "agu - sudo apt-get update"
	echo "suu - update, upgrade, and autoremove"
	echo "agui - sudo apt-get update && sudo apt-get install"
	echo "agr - sudo apt-get remove"
	echo "acs - sudo apt-cache search"
	echo "rec - record far left desktop desktop to output.mkv"
	echo "tp - trash-put"
	echo "tl - trash-list"
	echo "rwget - capture page, plus all linked pages"
}

alias agi="sudo apt-get install"
alias agu="sudo apt-get update"
alias suu="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove"
alias agui="sudo apt-get update && sudo apt-get install"
alias agr="sudo apt-get remove" 
alias acs="sudo apt-cache search"
alias rec="ffmpeg -f x11grab -s 1280x1024 -r 25 -i :0.0 output.mkv"
alias tp="sudo trash-put"
alias tl="sudo trash-list"
alias rwget="wget -e robots=off -r -nc -np --convert-links --level=0"
