#!/bin/sh

echo "=========================================="
echo "Wait, while the emacs config builds itself"
echo "=========================================="

cd ~

DIRFIRST=~/.emacs.d
DIRSECOND=~/.emacs.d.backup
FILEFIRST=~/.emacs

if [ ! -f $DIRFIRST ]
then
    mv ~/.emacs.d .emacs.d.backup;
fi

if [ ! -f $DIRSECOND ]
then
    mv ~/.emacs.d.backup .emacs.d.backup.another;
fi

if [ ! -f $FILEFIRST ]
then
    mv ~/.emacs .emacs.backup
fi

git clone https://github.com/manishmarahatta/dot-emacs.git ~/.emacs.d/
cd ~/.emacs.d
chmod +x configure
./configure
cd ~
emacs
