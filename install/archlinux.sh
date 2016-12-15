#!/bin/bash
#installs all additional packages on archlinux based systems

packages=(
  vim
  evince
  firefox
  thunderbird
  chromium
  vlc
  clementine
  tree
  ruby
  python
  jdk8-openjdk
  java-openjfx
  scala
  sbt
  gradle
  texlive-most
  biber
  )

ides=(
  eclipse-java
  intellij-idea-community-edition
  )

read -p "install ides?[y/n] " withIdes

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
