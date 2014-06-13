#!/bin/bash

vim -s ${HOME}/dotfiles/scripts/update.vim

date=$(date)
file=${HOME}/.vim/last-updated-vim.txt

echo $date > $file
