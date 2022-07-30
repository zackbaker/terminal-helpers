#!/bin/bash

echo "Setting up python packages"
{
    sudo pip install flake8
} || {
    echo "Need pip to install / Pip packages have failed"
    exit
}

echo "Cloning Vundle package manager"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Cloning Ale"
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale

echo "Setting up symlinked .vimrc"
project_root=$(dirname $(realpath $0))
ln -s $project_root/vim_files/.vimrc ~/.vimrc

mkdir -p ~/.vim/after/syntax/
ln -s $project_root/vim_files/python.vim ~/.vim/after/syntax/python.vim

mkdir -p ~/.vim/settings/
ln -s $project_root/vim_files/flake8 ~/.vim/settings/flake8
flake8 --config ~/.vim/settings/flake8

echo "Installing packages"
vim +InstallPlugin +qall
