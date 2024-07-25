alias 'please'='sudo'

# alias '.'='ls -lah'
alias '..'='cd ..'

alias 'cprr'='rsync -a --human-readable --progress'
alias 'cpr'='rsync --progress --size-only --inplace --verbose'

alias 'apt'='sudo apt'
alias 'apt-get'='apt'

alias 'updatedb'='sudo updatedb'
#alias 'pip'='sudo pip'

# alias 'myip'="wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias 'myip'="curl ifconfig.co"
alias 'mygateway'="ip route | awk '/default/ { print $3 }'"
alias 'clima'='curl wttr.in/Mexico_city'
alias 'speedtest'='date && speedtest-cli --simple && date'
alias 'mypc'='inxi -Fxxxrz'
alias 'pdf'='xreader-previewer' #Para ver pdfs

alias 'puertos'='netstat -pnltu | grep LISTEN'

# workdirs
alias 'ggw'='cd ~/www/src'
alias 'ggd'='cd ~/Descargas'
alias 'gge'='cd ~/Escritorio'

# GIT
alias 'ga'='git a'
alias 'gb'='git b'
alias 'gbr'='git br'
alias 'gcm'='git cm'
alias 'gdf'='git df'
alias 'gfe'='git fe'
alias 'ggr'='git gr'
alias 'gl'='git lg'
alias 'gmg'='git mg'
alias 'gco'='git co'
alias 'gpl'='git pl'
alias 'gps'='git ps'
alias 'gst'='git st'
alias 'gsw'='git sw'



# Docker
# container start docker
alias 'dup'='docker-compose up'

# container stop & remove
alias 'drm'='docker-compose rm -fs'

# container restart
alias 'dr'='docker-compose restart'

alias 'dst'='docker stop $(docker ps -a -q)'

#### Segunda sesión de telegram
alias 'telegram_account1'='/usr/bin/telegram -workdir  /home/kubrick/telegram/adangq.adip/ -- %u'

# Download youtube video with subs
# https://github.com/ytdl-org/yt-dlp
alias 'yt_video'="yt-dlp \
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
alias 'yt_audio'="yt-dlp \
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

alias 'yt_playlist_video'="yt-dlp \
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


alias 'yt_playlist_audio'="yt-dlp \
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
