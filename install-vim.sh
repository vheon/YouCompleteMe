#!/bin/sh
set -e

git clone --depth 1 https://github.com/vim/vim /tmp/vim
cd /tmp/vim
./configure --prefix="${HOME}/vim" --with-features=huge --enable-pythoninterp
make -j2
make install
