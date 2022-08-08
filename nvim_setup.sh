#!/bin/bash
# TODO: find difference between linux and mac and install what is neeeded based on that
# TODO: Install everything needed, missing a few things blocked by firewall ATM
# TODO: Find a way to install flake8 but to skip it if it's already installed (Probably the only python package that is needed)
# TODO: Automatically install pyright using npm... Or force myself to choose all LSP servers to install?
# TODO: Get the SQL syntax working in python again

function check_and_install {
    if ! command -v $1 &> /dev/null
    then
        sudo apt-get install $1 -y
    else
        echo "$1 already installed"
    fi
}

function check_and_symlink {
    if ! [[ -L "$2" ]]
    then
        ln -s $1 $2
    else
        echo "$2 symlink already exists"
    fi
}

echo "Installing needed packages"
echo "If you're having LSP issues mess with Node, the version needs to be the newest!"
sudo apt-get update
# Install neovim from source
check_and_install pip3
sudo pip3 install flake8

check_and_install ripgrep

echo "Setting up sym links"
project_root=$(dirname $(realpath $0))

mkdir -p ~/.config/
check_and_symlink $project_root/nvim/ ~/.config/

# mkdir -p ~/.vim/after/syntax/
# ln -s $project_root/vim_files/python.vim ~/.vim/after/syntax/python.vim

check_and_symlink $project_root/gopyvenv /usr/bin/gopyvenv

