#!/bin/bash

startTime=$(date)
vim -s ${HOME}/dotfiles/scripts/update.vim
endTime=$(date)

file=${HOME}/.vim/last-updated-vim.txt

echo -e "Start Time: " $startTime "\nEnd Time: " $endTime > $file
