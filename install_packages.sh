#!/usr/bin/env bash
set -euo pipefail

echo "=========================================================="
echo "==> 1. Actualizando repositorios base"
echo "=========================================================="
sudo apt update

echo "=========================================================="
echo "==> 2. Utilidades base de red, sistema y dependencias"
echo "=========================================================="
# - apt-transport-https / ca-certificates: Descargas seguras vía SSL/TLS en APT
# - curl / wget: Transferencia y descarga de archivos CLI
# - gnupg2 / software-properties-common: Gestión de llaves y repositorios APT
# - build-essential: Compilador gcc, g++, make para extensiones C
# - bash-completion: Autocompletado inteligente con TAB
# - unzip: Requerido para descomprimir tipografías .zip
# - net-tools / ifstat / iftop / nethogs: Monitoreo de tráfico, interfaces y ancho de banda por PID
# - speedtest-cli: Test de velocidad y latencia
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg2 \
    software-properties-common \
    build-essential \
    bash-completion \
    unzip \
    net-tools \
    ifstat \
    iftop \
    nethogs \
    speedtest-cli

echo "=========================================================="
echo "==> 3. Entorno de Terminal Moderno (Kitty, Zsh, CLI Tools)"
echo "=========================================================="
# - kitty: Terminal acelerada por GPU
# - zsh: Shell avanzada extensible
# - fzf: Buscador difuso interactivo para historial (Ctrl+R)
# - bat: Alternativa moderna a 'cat' con resaltado de sintaxis
# - zoxide: Navegación rápida por directorios aprendidos ('z')
# - eza: Listador moderno con soporte para iconos y Git ('ls' mejorado)
# - btop: Monitor interactivo de CPU, memoria, discos y red
# - screen: Multiplexor de terminales para sesiones en segundo plano
# - ranger: Gestor de archivos en consola basado en ncurses
# - calendar / ncal: Efemérides y calendarios verticales en consola
# - xdotool: Automatización de clics y ventanas en X11
# - xsensors: Lectura de temperaturas y voltajes de hardware
# - conky-all: Monitor de sistema para el escritorio
sudo apt install -y \
    kitty \
    zsh \
    fzf \
    bat \
    zoxide \
    eza \
    btop \
    screen \
    ranger \
    calendar \
    ncal \
    xdotool \
    xsensors \
    conky-all

# Corregir enlace simbólico para 'bat' en Debian si se instala como 'batcat'
if command -v batcat &>/dev/null && ! command -v bat &>/dev/null; then
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(which batcat)" "$HOME/.local/bin/bat"
fi

echo "=========================================================="
echo "==> 4. Tipografías (FiraCode Nerd Font)"
echo "=========================================================="
sudo apt install -y fonts-firacode || true

mkdir -p "$HOME/.local/share/fonts"
if ! fc-list : family | grep -qi "FiraCode Nerd Font"; then
    echo "Descargando FiraCode Nerd Font..."
    curl -fLo /tmp/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
    unzip -qo /tmp/FiraCode.zip -d "$HOME/.local/share/fonts/"
    rm -f /tmp/FiraCode.zip
    fc-cache -f -v > /dev/null
fi

echo "=========================================================="
echo "==> 5. Entorno de Desarrollo (Python, Node, pipx)"
echo "=========================================================="
# - python3-dev / python3-venv / python3-pip: Base de compilación y entornos virtuales de Python
# - pipx: Instalador de CLI tools de Python en entornos aislados
# - nodejs / npm: Runtime y gestor de paquetes JavaScript
sudo apt install -y \
    python3-dev \
    python3-venv \
    python3-pip \
    pipx \
    nodejs \
    npm

pipx ensurepath

# Herramientas globales en entornos virtuales aislados
pipx install pre-commit || true
pipx install ruff || true

echo "=========================================================="
echo "==> 6. Repositorio Oficial de Sublime Text 4"
echo "=========================================================="
if ! command -v subl &>/dev/null; then
    sudo install -m 0755 -d /etc/apt/keyrings
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/sublimehq.gpg > /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
    sudo apt update
    sudo apt install -y sublime-text
fi

echo "=========================================================="
echo "==> 7. Aplicaciones de Escritorio y Multimedia"
echo "=========================================================="
# - vlc: Reproductor multimedia
# - thunderbird: Correo y calendario
# - simplescreenrecorder: Grabación de escritorio en X11
sudo apt install -y \
    vlc \
    thunderbird \
    simplescreenrecorder

echo "=========================================================="
echo "==> 8. Oh My Zsh y Powerlevel10k (si no existen)"
echo "=========================================================="
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Instalando Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "Clonando Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

echo "=========================================================="
echo "✓ Todos los paquetes y dependencias del setup están listos."
echo "=========================================================="
