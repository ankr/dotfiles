#/bin/bash
#
# Check if OS is Mac
#
if [ "$(uname)" == "Darwin" ]; then
  # Check if Homebrew is installed  
  which -s brew
  if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  # Check if modules exists otherwise install it
  modules=("bash-completion" "git" "git-extras" "tig" "screen" "vim" "pwgen" "htop" "tree" "wget")
  for i in ${!modules[*]}
  do
    which -s ${modules[$i]} || brew install ${modules[$i]}
  done
fi

#
# Symlink files
#
for file in ~/.dotfiles/*
do
  base = $(basename $file)

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
