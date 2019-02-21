# setup the environment by copying & HARDLINKING the files

current=$(pwd)

echo "setup bash"
ln -sf $current/bashrc ~/.bashrc
ln -sf $current/zshrc ~/.zshrc
ln -sf $current/bash_aliases ~/.bash_aliases
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

#echo "setup emacs"
#ln -sf $current/emacs ~/.emacs

echo "setup prelude"
ln -s $current/personal ~/.emacs.d/personal

echo "setup sbt plugins"
sbt_plugins_path=~/.sbt/1.0/plugins
mkdir -p $sbt_plugins_path
ln -sf $current/sbt/plugins.sbt $sbt_plugins_path/plugins.sbt
