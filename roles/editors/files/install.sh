#!/bin/bash -e

if [ ! -e /tmp/emacs-25.1.tar.gz ]; then
  curl http://git.savannah.gnu.org/cgit/emacs.git/snapshot/emacs-25.1.tar.gz > /tmp/emacs-25.1.tar.gz
fi

tar xzf /tmp/emacs-25.1.tar.gz -C /tmp

cd /tmp/emacs-25.1

./autogen.sh
./configure
make
make install
make clean
