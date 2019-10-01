#!/bin/bash

workDir="/tmp/tmux-bake"

git clone https://github.com/tmux/tmux.git $workDir
pushd $workDir

sudo apt install -y automake build-essential pkg-config libevent-dev libncurses5-dev

sh autogen.sh
./configure && make

sudo make install

popd
rmdir $workDir
