#!/bin/sh

wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.23.0.tar.xz
mkdir crosstool-ng 
tar -xf crosstool-ng-*.tar* -C crosstool-ng --strip-components=1 
cd crosstool-ng
./bootstrap
./configure --enable-local
make