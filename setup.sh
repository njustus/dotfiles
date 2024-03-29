# setup the environment by copying & HARDLINKING the files

current=$(pwd)

echo "setup bash"
#ln -sf $current/bashrc ~/.bashrc
ln -sf $current/zshrc ~/.zshrc
#ln -sf $current/bash_aliases ~/.bash_aliases
#ln -sf $current/tmux.conf ~/.tmux.conf
cp -f $current/env_variables ~/.env_variables
cp -f $current/system_config ~/.system_config

echo "setup git"
ln -sf $current/gitconfig ~/.gitconfig
ln -sf $current/gitignore_global ~/.gitignore_global

echo "setup vim"
ln -sf $current/vimrc ~/.vimrc
cp -r $current/vim ~/vim
rm -r ~/.vim
mv ~/vim ~/.vim

echo "setup starship"
ln -sf $current/starship.toml ~/.config/starship.toml

echo "setup nushell"
mkdir -p ~/.config/nushell
ln -sf $current/nushell/env.nu ~/.config/nushell/env.nu
ln -sf $current/nushell/config.nu ~/.config/nushell/config.nu

#ln -sf $current/emacs ~/.emacs
echo "setup prelude"
curl -L https://git.io/epre | sh
rm -r ~/.emacs.d/personal
ln -s $current/personal ~/.emacs.d/personal
echo "[INFO] install needed icon fonts: 'M-x all-the-icons-install-fonts'"

echo "setup sbt plugins"
sbt_plugins_path=~/.sbt/1.0/plugins
mkdir -p $sbt_plugins_path
ln -sf $current/sbt/plugins.sbt $sbt_plugins_path/plugins.sbt
