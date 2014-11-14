#!/bin/bash

dir=~/dotfiles
files="conkyrc gitconfig latexmkrc tmux.conf vimrc Xmodmap xbindkeysrc"

cd $dir

for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

awesomedir=~/.config/awesome
mkdir -p $awesomedir
ln -s $dir/rc.lua $awesomedir

echo ". $dir/bashrc" >> ~/.bashrc
