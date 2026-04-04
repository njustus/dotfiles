#!/bin/bash

packages=(
    bash
    bat
    btm
    curl
    eza
    fd-find
    fzf
    htop
    httpie
    jq
    neovim
    python3
    python3-pip
    ripgrep
    ruby
    starship
    tmux
    tree
    vim
    zoxide
    zsh
    tldr
    maven
    gradle
    git
    default-jdk
    podman
    podman-compose
    firefox
    chromium-browser
    keepassxc
    libreoffice
    thunderbird
    virtualbox
    virtualbox-ext-pack
)

sudo apt update
sudo apt upgrade -y
sudo apt install -y "${packages[@]}"


# snap packages
snapPackages=(
    dust
    code
)

sudo snap install "${packages[@]}"
