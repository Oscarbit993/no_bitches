#!/bin/bash

set -euo pipefail

paquetes=(
    firefox
    neovim
    git
    cmatrix
    base-devel
    hyprland
    kitty
    rofi
    awww
    btop
    imagemagick
    curl
    wget
    nmap
    burpsuite
    zram-generator
    gobuster
    fastfetch
    spiderfoot
    maltego
    wireshark-qt
    hyprshot
    wl-clipboard
    torbrowser-launcher
    zsh
    fzf
    bat
    torsocks
    pipewire
    pipewire-alsa
    pipewire-jack
    wireplumber
    pipewire-pulse
    playerctl
    bluez
    bluez-utils
    blueman
    yazi
    nautilus
    nerd-fonts
    flatpak
    starship
)

main() {
    sudo pacman -Syu --noconfirm
    curl -O https://blackarch.org/strap.sh 
    chmod +x strap.sh
    sudo ./strap.sh
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm "${paquetes[@]}"
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
    paru -S --needed --noconfirm vscodium-bin
    mkdir -p ~/.config/hypr ~/Wallpapers ~/.local/share/fonts 
    curl -L -o Maple-NF.zip https://github.com/subframe7536/maple-font/releases/download/v7.9/MapleMono-NF-unhinted.zip
    curl -L -o MapleMono.zip https://github.com/subframe7536/maple-font/releases/download/v7.9/MapleMono-TTF.zip
    unzip -o Maple-NF.zip -d ~/.local/share/fonts
    unzip -o MapleMono.zip -d ~/.local/share/fonts
    curl -L -o $HOME/Wallpapers/Wall-1.png https://w.wallhaven.cc/full/k8/wallhaven-k82p6d.png
    curl -L -o $HOME/Wallpapers/Wall-2.png https://w.wallhaven.cc/full/w5/wallhaven-w5m62x.png
    curl -L -o $HOME/Wallpapers/Wall-3.png https://w.wallhaven.cc/full/xe/wallhaven-xepp7d.jpg
    curl -L -o $HOME/Wallpapers/Wall-4.png https://w.wallhaven.cc/full/ml/wallhaven-ml2191.jpg
    curl -L -o $HOME/Wallpapers/Wall-5.png https://w.wallhaven.cc/full/5g/wallhaven-5g96j3.jpg
    curl -L -o $HOME/Wallpapers/Wall-6.png https://w.wallhaven.cc/full/3q/wallhaven-3q5k8y.png
    curl -L -o $HOME/Wallpapers/Wall-7.png https://w.wallhaven.cc/full/zp/wallhaven-zpo7dy.png
    curl -L -o $HOME/Wallpapers/Wall-8.png https://w.wallhaven.cc/full/9d/wallhaven-9djdkw.png
    curl -L -o $HOME/Wallpapers/Wall-9.png https://w.wallhaven.cc/full/kx/wallhaven-kx99jm.png
    curl -L -o $HOME/Wallpapers/Wall-10.png https://w.wallhaven.cc/full/7j/wallhaven-7jjo5e.jpg
    flatpak install -y flathub org.vinegarhq.Sober
    sudo systemctl enable --now bluetooth.service
    systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service
    cp Dfiles/hyprland.lua ~/.config/hypr
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    cp Dfiles/.zshrc ~/
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
}

main
reboot
