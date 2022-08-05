#!/bin/bash

#echo "Setting up python packages"
#{
#    sudo pip install flake8
#} || {
#    echo "Need pip to install / Pip packages have failed"
#    exit
#}

echo "Installing needed packages"
sudo apt-get update
sudo apt-get install neovim -y

echo "Setting up sym links"
project_root=$(dirname $(realpath $0))
mkdir -p ~/.config/
ln -s $project_root/nvim/ ~/.config/

# mkdir -p ~/.vim/after/syntax/
# ln -s $project_root/vim_files/python.vim ~/.vim/after/syntax/python.vim

sudo ln -s $project_root/gopyvenv /usr/bin/gopyvenv

