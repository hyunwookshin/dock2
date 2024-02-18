#!/usr/bin/env bash

if [ "$USER" != "hshin" ]; then
   echo "Please run as 'hshin'"
   exit 1
fi

set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp config/.bashrc ~/.bashrc
cp config/.vimrc ~/.vimrc
cp config/.screenrc ~/.screenrc
mkdir ~/.vim/colors
cp config/xoria256.vim ~/.vim/colors/
cp config/.tmux.conf ~
