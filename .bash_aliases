# ==============================================================================
# ALIAS Y FUNCIONES DEL SISTEMA (.bash_aliases)
# Compatible con Zsh y Bash
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. SISTEMA, PERMISOS Y NAVEGACIÓN BÁSICA
# ------------------------------------------------------------------------------
alias please='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias apt='sudo apt'
alias updatedb='sudo updatedb'
alias pdf='xdg-open >/dev/null 2>&1'

# Listados modernos con eza (reemplazo visual de ls)
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lh --icons=auto --group-directories-first --git'
alias la='eza -a --icons=auto --group-directories-first'
alias lt='eza --tree --level=2 --icons=auto'

# Paginador moderno con bat (reemplazo con sintaxis de cat)
alias bat='batcat --theme="TwoDark"'

# ------------------------------------------------------------------------------
# 2. RED Y DIAGNÓSTICO
# ------------------------------------------------------------------------------
alias myip='curl -s ifconfig.co'
alias mygateway="ip route | awk '/default/ { print \$3 }'"
alias puertos='ss -tulpn'
alias speedtest='date && speedtest-cli --simple && date'

# Sincronización robusta con rsync
alias cprr='rsync -a --human-readable --progress'
alias cpr='rsync --progress --size-only --inplace --verbose'

# ------------------------------------------------------------------------------
# 3. ACCESOS DIRECTOS DE NAVEGACIÓN
# ------------------------------------------------------------------------------
alias gw='cd ~/www/'
alias gd='cd ~/Downloads'
alias gde='cd ~/Desktop'

# ------------------------------------------------------------------------------
# 4. REPORTES Y CLIMA
# ------------------------------------------------------------------------------
alias clima='echo "🌍 Reporte: Clima, Hora y Ciclo Solar" && for c in "CDMX|19.4285|-99.1277" "Madrid|40.4168|-3.7038" "Roma|41.8919|12.5113"; do IFS="|" read -r n lat lon <<< "$c"; data=$(curl -s --max-time 3 "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code&daily=sunrise,sunset&timezone=auto&forecast_days=1"); echo "$data" | python3 -c "import sys, json; d=json.load(sys.stdin); c=d[\"current\"]; day=d[\"daily\"]; t=c[\"time\"].split(\"T\")[1]; am=day[\"sunrise\"][0].split(\"T\")[1]; oc=day[\"sunset\"][0].split(\"T\")[1]; codes={0:\"Despejado\",1:\"Despejado\",2:\"P.Nublado\",3:\"Nublado\",45:\"Niebla\",61:\"Lluvia\",95:\"Tormenta\"}; sky=codes.get(c[\"weather_code\"], \"--\"); print(\"📍 %-8s | 🕒 %5s | 🌅 %5s | 🌇 %5s | 🌡️  %s°C | ☁️  %s\" % (\"$n\", t, am, oc, c[\"temperature_2m\"], sky))"; done && echo "---------------------------------------------------------------------------------------"'

# ------------------------------------------------------------------------------
# 5. MONTAJES REMOTOS (SSHFS)
# ------------------------------------------------------------------------------
alias jardin_mount='mkdir -p /media/$USER/jardin && sshfs jacaranda:/media/jardin /media/$USER/jardin -o IdentityFile=$HOME/.ssh/jacaranda,uid=$(id -u),gid=$(id -g),idmap=user,compression=no,kernel_cache,noatime,nodev,reconnect,transform_symlinks,allow_other,ServerAliveInterval=15,ServerAliveCountMax=3'
alias junmount='fusermount3 -u /media/$USER/jardin'

# ------------------------------------------------------------------------------
# 6. DOCKER & DOCKER COMPOSE
# ------------------------------------------------------------------------------
alias dup='docker compose up'
alias drm='docker compose rm -fs'
alias dr='docker compose restart'
alias dst='docker stop $(docker ps -q) 2>/dev/null || echo "No hay contenedores corriendo"'
alias dsql='docker compose exec postgres psql -U tianguis_digital_user tianguis_digital_db'
alias dmigrate='docker compose exec tianguis python manage.py makemigrations && docker compose exec tianguis python manage.py migrate'

# ------------------------------------------------------------------------------
# 7. DESCARGA MULTIMEDIA (yt-dlp)
# ------------------------------------------------------------------------------
alias yt_video="yt-dlp \
  -o './%(uploader)s/%(title)s.%(ext)s' \
  --sub-lang en,es --write-auto-sub --write-sub --convert-subs srt \
  --no-playlist \
  --continue \
  --ignore-errors \
  --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
  --no-overwrites \
  --merge-output-format mkv"

alias yt_audio="yt-dlp \
  -o './%(uploader)s/%(title)s.%(ext)s' \
  --ignore-errors \
  --continue \
  --default-search 'ytsearch' \
  --extract-audio \
  --audio-format mp3 \
  --format bestaudio \
  --add-metadata \
  --no-overwrites \
  --embed-thumbnail"

alias yt_playlist_video="yt-dlp \
  -o './%(playlist_uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' \
  --sub-lang en,es --write-auto-sub --write-sub --convert-subs srt \
  --continue \
  --min-filesize 50k \
  --ignore-errors \
  --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
  --yes-playlist \
  --no-overwrites \
  --merge-output-format mkv"

alias yt_playlist_audio="yt-dlp \
  -o './%(playlist_uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' \
  --ignore-errors \
  --continue \
  --default-search 'ytsearch' \
  --extract-audio \
  --audio-format mp3 \
  --format bestaudio \
  --add-metadata \
  --yes-playlist \
  --no-overwrites \
  --embed-thumbnail"

# Descarga simultánea audio + video
yt_() {
    yt_audio -k "$1"
    yt_video "$1"
}

yt_playlist() {
    yt_playlist_audio -k "$1"
    yt_playlist_video "$1"
}