#!/bin/bash

dir=~/dotfiles
files="conkyrc gitconfig latexmkrc tmux.conf vimrc"

cd $dir

for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

echo ". $dir/bashrc" >> ~/.bashrc
