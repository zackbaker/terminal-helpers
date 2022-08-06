#!/bin/bash
# TODO: find difference between linux and mac and install what is neeeded based on that
# TODO: Install everything needed, missing a few things blocked by firewall ATM
# TODO: Find a way to install flake8 but to skip it if it's already installed (Probably the only python package that is needed)
# TODO: Automatically install pyright using npm... Or force myself to choose all LSP servers to install?
# TODO: Get the SQL syntax working in python again

#echo "Setting up python packages"
#{
#    sudo pip install flake8
#} || {
#    echo "Need pip to install / Pip packages have failed"
#    exit
#}

echo "Installing needed packages"
echo "If you're having LSP issues mess with Node, the version needs to be the newest!"
sudo apt-get update
sudo apt-get install neovim, ripgrep -y

echo "Setting up sym links"
project_root=$(dirname $(realpath $0))
mkdir -p ~/.config/
ln -s $project_root/nvim/ ~/.config/

# mkdir -p ~/.vim/after/syntax/
# ln -s $project_root/vim_files/python.vim ~/.vim/after/syntax/python.vim

sudo ln -s $project_root/gopyvenv /usr/bin/gopyvenv

