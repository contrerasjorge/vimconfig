#!/bin/bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua

for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/.vim/$f ~/.config/nvim/$f
  done
