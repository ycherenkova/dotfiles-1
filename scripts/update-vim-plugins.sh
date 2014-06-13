#!/bin/bash

startTime=$(date)
vim +PluginClean! +PluginInstall! +qall
endTime=$(date)

file=${HOME}/.vim/last-updated-vim.txt

echo -e "Start Time: " $startTime "\nEnd Time: " $endTime > $file
