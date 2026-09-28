# ~/.bashrc: executed by bash(1) for non-login shells.

# Si la sesión no es interactiva, salir de inmediato
case $- in
    *i*) ;;
      *) return;;
esac

# ---------------------------------------------------------
# HISTORIAL AVANZADO & SINCRONIZACIÓN EN VIVO
# ---------------------------------------------------------
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=100000
export HISTFILESIZE=200000
shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize

# Compartir historial entre pestañas sin saturar CPU
PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND:-}"

# ---------------------------------------------------------
# PROMPT ESTÁNDAR LIMPIO (Rojo para root, Verde para agave)
# ---------------------------------------------------------
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm*|rxvt*|kitty*)
        color_prompt=yes
        ;;
esac

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} -eq 0 ]]; then
        # Prompt de root (Rojo de advertencia)
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        # Prompt de usuario estándar limpio
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# Título de terminal
case "$TERM" in
xterm*|rxvt*|kitty*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ---------------------------------------------------------
# COLORES Y ALIAS BASE
# ---------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -lFh'
alias la='ls -Ah'
alias l='ls -CFh'

# Notificación al terminar tareas largas (ej: sleep 10; alert)
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Cargar alias de trabajo y sistema
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Autocompletado programable
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Silenciar campana/beep del sistema en entorno gráfico
if [ -n "$DISPLAY" ]; then
  xset b off 2>/dev/null || true
fi

# ---------------------------------------------------------
# RUTAS DE USUARIO Y ENTORNOS
# ---------------------------------------------------------
# Binarios locales de usuario
export PATH="$HOME/.local/bin:$PATH"

# Pyenv (solo si se instala)
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init -)"
    fi
fi
