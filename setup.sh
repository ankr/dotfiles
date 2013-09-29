#/bin/bash
current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # Where this script is located

blacklist=('.' '..' 'setup.sh' 'README.md') # Do NOT link these files

for file in $current/*
do
    base=$(basename $file)

    if ! [ $(echo ${blacklist[@]} | grep $base | wc -l) -gt 0 ] ;
    then
        if [ -f "$HOME/.$base" ];
        then
            mv "$HOME/.$base" "$HOME/.$base.bak" # Backup existing files
            echo "Moved existing ~/.$base to $HOME/.$base.bak"
        fi

        ln -s $file "$HOME/.$base"
        echo "Setup symbolic link for ~/.$base"
    fi
done
