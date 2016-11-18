# setup the environment by copying & HARDLINKING the files

echo "setup bash"
ln -f ./bashrc ~/.bashrc
ln -f ./bash_aliases ~/.bash_aliases
cp -f ./env_variables ~/.env_variables

echo "setup git"
ln -f ./gitconfig ~/.gitconfig
ln -f ./gitignore_global ~/.gitignore_global

echo "setup vim"
ln -f ./vimrc ~/.vimrc
cp -r ./vim ~/vim
rm -r ~/.vim
mv ~/vim ~/.vim

echo "setup emacs"
ln -f ./emacs ~/.emacs

echo "setup sbt plugins"
sbt_plugins_path=~/.sbt/0.13/plugins
mkdir -p $sbt_plugins_path
ln -f ./sbt/plugins.sbt $sbt_plugins_path/plugins.sbt

echo "=== set your system in ~/.env_variables using $SYSTEM"
