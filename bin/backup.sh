#!/bin/bash

# Backup current directory and send to my gmail

SOURCE=${1:-.}
TARGET="$HOME/tmp/$(date | md5).tar.gz"

tar -zcvf $TARGET $SOURCE

echo "Backup of $PWD" | mutt -s "Backup" $DOTFILES_EMAIL -a $TARGET

rm $TARGET
