#/bin/bash

current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in $current/*
do
	base=$(basename $file)

	if ! [ "$file" == '.' ] && ! [ "$file" == '..' ] && ! [ "$base" == 'setup.sh' ]; then
		ln -s $file "$HOME/.$base"
		echo "- Linked $base"
	fi
done
