#!/usr/bin/env bash

if [ "$USER" != "hshin" ]; then
   sudo adduser hshin
   sudo passwd hshin
   sudo usermod -aG wheel hshin
   echo "Run 'sudo visudo', and uncomment '%wheel  ALL=(ALL)   ALL'. Also enable password. This is a separate bash session:"
   bash
   echo "Please run this script again as 'hshin'"
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
