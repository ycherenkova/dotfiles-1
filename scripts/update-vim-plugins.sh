#!/bin/bash

# Crontab might look something like:
# 00 04 * * * /home/chittle/dotfiles/scripts/update-vim-plugins.sh
# min hour dom month dow script

startTime=$(date)
vim +PluginClean! +PluginInstall! +qall > /dev/null
endTime=$(date)

file=${HOME}/.vim/last-updated-vim.txt

echo -e "Start Time: " $startTime "\nEnd Time: " $endTime > $file
