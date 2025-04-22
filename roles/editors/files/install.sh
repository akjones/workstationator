#!/bin/bash -e

export CC=/usr/bin/gcc-10
export CXX=/usr/bin/gcc-10

emacs_version="29.3"
if [ ! -e /tmp/emacs-${emacs_version}.tar.gz ]; then
  curl http://git.savannah.gnu.org/cgit/emacs.git/snapshot/emacs-${emacs_version}.tar.gz > /tmp/emacs-${emacs_version}.tar.gz
fi

tar xzf /tmp/emacs-${emacs_version}.tar.gz -C /tmp

cd /tmp/emacs-${emacs_version}

./autogen.sh
./configure --with-native-compilation=aot --with-imagemagick --with-json \
    --with-tree-sitter --with-xft
make -j$(nproc)
make install
make clean
