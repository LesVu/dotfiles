#!/bin/bash

git clone https://github.com/LesVu/dotfiles
cp -r dotfiles/.config/nvim ~/.config/

sudo apt-get install clangd clang-format -y -q

nvim
