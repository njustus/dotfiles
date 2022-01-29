#!/bin/bash
#installs all additional packages on archlinux based systems

packages=(
	zsh
  tmux
  vim
  htop
  exa
  emacs
  code
  evince
  firefox
  thunderbird
  chromium
  vlc
  tree
  ruby
  python
  java-openjfx
  scala
  sbt
  gradle
  texlive-most
  biber
  keepassxc
  neofetch
  telegram-desktop
  virtualbox
  libreoffice-fresh
  )

ides=(
  eclipse-java
  intellij-idea-community-edition
  )

read -p "install ides?[y/n] " withIdes

echo "installing prelude.."
curl -L https://git.io/epre | sh

echo "installing zsh.."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pacman -Sy #update db
for package in ${packages[@]};
do
  pacman -S --needed --noconfirm $package
done;

if [ $withIdes == "y" ]; then
  for package in ${ides[@]};
  do
    pacman -S --needed --noconfirm $package
  done;
fi;
