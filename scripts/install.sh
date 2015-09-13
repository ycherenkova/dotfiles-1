#!/bin/bash

dir=~/dotfiles
files="conkyrc gitconfig latexmkrc tmux.conf vimrc Xmodmap xbindkeysrc Xresources"

cd $dir

for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

awesomedir=~/.config/awesome
mkdir -p $awesomedir/vicious/widgets
ln -s $dir/config/awesome/rc.lua $awesomedir
ln -s $dir/config/awesome/keybindings.lua $awesomedir
ln -s $dir/config/awesome/vicious/widgets/cmus.lua $awesomedir/vicious/widgets

cmusdir=~/.config/cmus
mkdir -p $cmusdir
ln -s $dir/config/cmus/cmusrc $cmusdir/.cmusrc

terminatordir=~/.config/terminator
mkdir -p $terminatordir
ln -s $dir/config/terminator/config $terminatordir/config

echo ". $dir/bashrc" >> ~/.bashrc
