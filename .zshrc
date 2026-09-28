# ==============================================================================
# CONFIGURACIÓN PRINCIPAL DE ZSH (.zshrc)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. POWERLEVEL10K INSTANT PROMPT (Aceleración de arranque)
# ------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------
# 2. ENTORNO OH-MY-ZSH Y TEMA
# ------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Rutas de ejecución de usuario (prioridad local)
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Editor predeterminado para herramientas CLI y Git
export EDITOR='nano'
export VISUAL='nano'

# ------------------------------------------------------------------------------
# 3. PLUGINS DE OH-MY-ZSH
# ------------------------------------------------------------------------------
# Nota: 'zsh-syntax-highlighting' siempre debe ir al final absoluto de la lista.
plugins=(
  git                      # Alias y helpers de git
  fzf                      # Búsqueda interactiva (Ctrl+R / Ctrl+T)
  sudo                     # Doble ESC para prefijar sudo al comando actual
  docker                   # Autocompletado de comandos Docker
  docker-compose           # Autocompletado de servicios Docker Compose
  python                   # Autocompletado de Python
  pip                      # Autocompletado de paquetes pip
  zsh-autosuggestions      # Sugerencias en gris basadas en historial
  zsh-syntax-highlighting  # Coloreado de sintaxis en tiempo real (verde/rojo)
)

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# 4. ATAJOS DE TECLADO PERSONALIZADOS
# ------------------------------------------------------------------------------
# Aceptar sugerencia gris de autosuggestions con 'Ctrl + Espacio'
bindkey '^ ' autosuggest-accept

# ------------------------------------------------------------------------------
# 5. HISTORIAL AVANZADO Y SINCRONIZACIÓN EN TIEMPO REAL
# ------------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=200000

setopt SHARE_HISTORY          # Comparte comandos entre pestañas activas al instante
setopt INC_APPEND_HISTORY     # Escribe al archivo inmediatamente al ejecutar
setopt HIST_IGNORE_DUPS       # No duplica comandos idénticos consecutivos
setopt HIST_IGNORE_ALL_DUPS   # Si un comando viejo se repite, borra la entrada anterior
setopt HIST_IGNORE_SPACE      # Comandos con espacio al inicio no se guardan
setopt HIST_EXPIRE_DUPS_FIRST # Purga duplicados primero si se llena el buffer
setopt HIST_REDUCE_BLANKS     # Remueve espacios en blanco innecesarios

# ------------------------------------------------------------------------------
# 6. INTEGRACIONES MODERNAS Y UTILIDADES
# ------------------------------------------------------------------------------
# Cargar personalización visual de Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zoxide (cd inteligente que aprende rutas frecuentes)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# fpreview: Buscador interactivo de archivos con vista previa (bat) y apertura en editor
fpreview() {
  local file
  file=$(fzf --preview 'batcat --style=numbers --color=always --line-range :500 {} 2>/dev/null || cat {}')
  [ -n "$file" ] && ${EDITOR:-nano} "$file"
}

# ------------------------------------------------------------------------------
# 7. CARGA DE ALIAS DEL SISTEMA
# ------------------------------------------------------------------------------
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases