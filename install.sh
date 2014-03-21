#/bin/bash

# Symlink everything in `files` dir to `~`
for file in ~/.dotfiles/files/*
do
  base=$(basename $file)
  path="$HOME/.$base"

  # Backup existing files or delete if it's a symlink
  if [ -h $path ] ; then
    rm $path
    echo "Removed existing symlink for $path"
  fi
  if [ -f $path ] ; then
    mv $path "$path.bak"
    echo "Moved existing $path to $path.bak"
  fi

  ln -s $file $path
  echo "Setup symbolic link for $path"
done

# Make sure vim backup directories exists
mkdir -p {~/.vim/backups,~/.vim/swaps,~/.vim/undo}
