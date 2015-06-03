#!/bin/bash

dir=~/dotfiles
files="conkyrc gitconfig latexmkrc tmux.conf vimrc Xmodmap xbindkeysrc Xresources"

cd $dir

for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

awesomedir=~/.config/awesome/vicious/widgets
mkdir -p $awesomedir
ln -s $dir/awesome/rc.lua $awesomedir
ln -s $dir/awesome/keybindings.lua $awesomedir
ln -s $dir/awesome/cmus.lua $awesomedir/vicious/widgets

echo ". $dir/bashrc" >> ~/.bashrc
