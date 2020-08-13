alias 'please'='sudo'

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

alias 'puertos'='netstat -pnltu'
alias 'soff'='sudo service postgresql@9.6-main stop && sudo service postgresql stop && sudo service apache2 stop'
alias 'webon'='sudo service postgresql start && sudo /opt/lampp/lampp startapache'


# workdirs
alias 'gw'='cd ~/www/'

alias 'gd'='cd ~/Downloads'
alias 'gde'='cd ~/Desktop'
alias 'ga'='cd /home/kubrick/www/admos'
alias 'ga1'='cd /home/kubrick/www/admos/admos_php'
alias 'ga2'='cd /home/kubrick/www/admos/admos_python'
alias 'ga3'='cd /home/kubrick/www/admos/admos_cronoxd'

alias 'ghd'='cd /media/kubrick/data/'
alias 'gx'='cd /media/kubrick/data/nextcloud/xiaomi/'
alias 'gdb'='cd ~/Dropbox/pixelead0/Dropbox'

# Docker

# container start docker
alias 'dup'='docker-compose up'

# container stop & remove
alias 'drm'='docker-compose rm -fs'

# container restart
alias 'dr'='docker-compose restart'

alias 'dst'='docker stop $(docker ps -a -q)'

alias 'dsql'='docker-compose exec postgres psql -U tianguis_digital_user tianguis_digital_db'

alias 'dmigrate'='docker-compose exec tianguis python manage.py makemigrations && docker-compose exec tianguis python manage.py migrate'

# Segunda sesión de telegram
alias 'telegram_account1'='/usr/bin/telegram -workdir  /home/kubrick/telegram/adangq.adip/ -- %u'


# Download youtube video with subs
# https://github.com/ytdl-org/youtube-dl
alias 'yt_video'="youtube-dl \
-o ./'%(uploader)s/%(title)s.%(ext)s' \
--sub-lang en,es --write-auto-sub --write-sub --convert-subs srt \
--no-playlist \
--no-call-home \
--continue \
--ignore-errors  \
--no-call-home \
--format bestvideo[ext=mp4]+bestaudio[ext=m4a] \
--no-overwrites \
--merge-output-format mkv "

# Download youtube audio with subs file
alias 'yt_audio'="youtube-dl \
-o ./'%(uploader)s/%(title)s.%(ext)s' \
--ignore-errors  \
--continue  \
--default-search "ytsearch" \
--extract-audio \
--audio-format mp3 \
--format bestaudio[ext=m4a] \
--add-metadata \
--yes-playlist \
--no-overwrites \
--embed-thumbnail"

alias 'yt_playlist_video'="youtube-dl \
-o ./'%(playlist_uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.f%(format)s.%(ext)s' \
--sub-lang en,es --write-auto-sub --write-sub --convert-subs srt \
--continue  \
--min-filesize 50k  \
--ignore-errors  \
--no-call-home \
--format bestvideo[ext=mp4]+bestaudio[ext=m4a] \
--yes-playlist \
--no-overwrites \
--merge-output-format mkv "


alias 'yt_playlist_audio'="youtube-dl \
-o ./'%(playlist_uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.f%(format)s.%(ext)s' \
--ignore-errors  \
--continue  \
--default-search "ytsearch" \
--extract-audio \
--audio-format mp3 \
--format bestaudio[ext=m4a] \
--add-metadata \
--yes-playlist \
--no-overwrites \
--embed-thumbnail "

# Download youtube audio & video
function yt_playlist {
    yt_playlist_audio -k $1
    yt_playlist_video $1
}
# Download youtube audio & video
function yt_ {
    yt_audio -k $1
    yt_video $1
}
