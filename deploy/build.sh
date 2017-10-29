#!/bin/bash

cd "$(dirname "$0")"

TOOLCHAIN=aarch64-linux-gnu

mkdir build
cd build
cmake -D CMAKE_C_COMPILER=$(command -v ${TOOLCHAIN}-gcc) -D CMAKE_CXX_COMPILER=$(command -v ${TOOLCHAIN}-g++) $@ .. 
make
cd ..

