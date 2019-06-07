alias 'cprr'='rsync -a --human-readable --progress'
alias 'cpr'='rsync --progress --size-only --inplace --verbose'

alias 'apt'='sudo apt'
alias 'apt-get'='apt'

alias 'updatedb'='sudo updatedb'
alias 'pip'='sudo pip'

alias 'myip'="wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias 'mygateway'="ip route | awk '/default/ { print $3 }'"
alias 'clima'='curl wttr.in/Mexico_city'
alias 'speedtest'='date && ~/speedtest-cli --simple && date'

alias 'pdf'='xreader-previewer' #Para ver pdfs

#Vagrant Commandas
alias 'vmsrv'='fab runserver'
alias 'vmon'='vagrant up && fab runserver'
alias 'vmoff'='vagrant halt'
alias 'vmssh'='vagrant ssh'

# workdirs
alias 'ga'='cd ~/www/adip'
alias 'gw'='cd ~/www/'
alias 'gn'='cd /media/kubrick/data/nextcloud/xiaomi/'
alias 'gdb'='cd ~/Dropbox/pixelead0/Dropbox'
alias 'gproy'='cd /media/kubrick/data/proyectos/www'
