#/bin/bash

read -p "
Hello my old friend!

You probably don't even remember writing this script, but here goes...

This will setup symoblic links for the config files.
It will also DELETE any existing files!
- are you sure you want to continue (y/n)? " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # Where this script is located

blacklist=('.' '..' 'setup.sh' 'README.md') # Do NOT link these files

for file in $current/*
do
    base=$(basename $file)

    if ! [ $(echo ${blacklist[@]} | grep $base | wc -l) -gt 0 ] ;
    then
        if [ -f "$HOME/.$base" ];
        then
            rm "$HOME/.$base" # Remove existing files
        fi

        ln -s $file "$HOME/.$base"
        echo "Setup symbolic link for ~/.$base"
    fi
done
