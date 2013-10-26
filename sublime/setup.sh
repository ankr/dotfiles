#/bin/bash

local_path="$HOME/.dotfiles/sublime/"
install_path="$HOME/Library/Application Support/Sublime Text 3/Packages/User/"

preferences="${install_path}Preferences.sublime-settings"
packages="${install_path}Package Control.sublime-settings"
bindings="${install_path}Default (OSX).sublime-keymap"

if [[ ! -d "$install_path" ]] ; then
	echo "Sublime Text 3 not found, exiting."
	exit
fi

# Preferences
if [ -f "$preferences" ] && $(mv "$preferences" "$preferences.bak") ; then
	echo "Backed up existing settings file to $preferences.bak"
fi

ln -s "${local_path}Preferences.sublime-settings" "$preferences"
echo "Setup symbolic link for Sublime Text 3 Preferences"

# Packages
if [ -f "$packages" ] && $(mv "$packages" "$packages.bak") ; then
	echo "Backed up existing packages file to $packages.bak"
fi

ln -s "${local_path}Package Control.sublime-settings" "$packages"
echo "Setup symbolic link for Sublime Text 3 Package Control"

# Bindings
if [ -f "$bindings" ] && $(mv "$bindings" "$bindings.bak") ; then
	echo "Backed up existing bindings file to $bindings.bak"
fi

ln -s "${local_path}Default (OSX).sublime-keymap" "$bindings"
echo "Setup symbolic link for Sublime Text 3 key bindings"
