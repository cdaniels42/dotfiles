# exports 
export EDITOR=vim 
export PS1="[\u][\h][\w] \\$ " 
# config
package_manager="apt" # apt or pacman 
if [[ -f `which youtube` ]]
then 
	youtube_dl_installed="yes"
else
	youtube_dl_installed="no"
fi

if [[ -f `which ffmpeg` ]]
then 
	ffmpeg_installed="yes"
else
	ffmpeg_installed="no"
fi 

if [[ -f `which trash-put` ]] 
then
	trash_cli_installed="yes"
else
	trash_cli_installed="no"
fi 

if [[ -f `which wget` ]]
then 
	wget_installed="yes"
else
	wget_installed="no"
fi


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
	echo "agi - package manager install"
	echo "agu - package manager update"
	echo "suu - update, upgrade, and autoremove"
	echo "agui - package manager update and install"
	echo "agr - package manager uninstall"
	echo "acs - package manager search "
	
	if [ "$ffmpeg_installed" == "yes" ]
	then
	echo "rec - record far left desktop desktop to output.mkv"
	fi 
	
	if [ "$trash_cli_installed" == "yes" ]
	then	
	echo "tp - trash-put"
	echo "tl - trash-list"
	fi
	
	if [ "$wget_installed" == "yes" ]
	then
	echo "rwget - capture page, plus all linked pages"
	fi 
}

if [ "$package_manager" == "apt" ]
then
alias agi="sudo apt-get install"
alias agu="sudo apt-get update"
alias suu="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove"
alias agui="sudo apt-get update && sudo apt-get install"
alias agr="sudo apt-get remove" 
alias acs="sudo apt-cache search"
fi 

if [ "$package_manager" == "pacman" ]
then 
echo "pacman support is not yet implimented"
fi 

if [ "$ffmpeg_installed" == "yes" ]
then 
alias rec="ffmpeg -f x11grab -s 1280x1024 -r 25 -i :0.0 output.mkv"
fi 

if [ "$trash_cli_installed" == "yes" ] 
then 
alias tp="sudo trash-put"
alias tl="sudo trash-list"
fi 

if [ "$wget_installed" == "yes" ]
then 
alias rwget="wget -e robots=off -r -nc -np --convert-links --level=0"
fi 
