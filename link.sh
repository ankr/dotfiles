#/bin/bash

for file in ~/.dotfiles/*
do
  base=$(basename $file)

  # Only link certain files
  if [ "$base" == "bash_profile" ] ||
     [ "$base" == "bashrc" ] ||
     [ "$base" == "gitconfig" ] ||
     [ "$base" == "vimrc" ] ||
     [ "$base" == "inputrc" ] ||
     [ "$base" == "screenrc" ]
  then
      if [ -f "$HOME/.$base" ] ; then
          mv "$HOME/.$base" "$HOME/.$base.bak" # Backup existing files
          echo "Moved existing ~/.$base to ~/.$base.bak"
      fi

      ln -s $file "$HOME/.$base"
      echo "Setup symbolic link for ~/.$base"
  fi
done

# A few dependencies
mkdir -p {~/.vim/backups,~/.vim/swaps,~/.vim/undo}
