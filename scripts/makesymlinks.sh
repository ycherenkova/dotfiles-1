#!/bin/bash

location="/media/Data/Users/Nicholas"
files="Documents Downloads Videos Music Pictures Dropbox"

for file in $files; do
  rm -r ~/$file
  link=$location/$file
  echo "Creating symlink to $link."
  ln -s $link ${HOME}
done
