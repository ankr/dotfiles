# dotfiles

My dot files. Their contents is brought together from all parts of the internet.
These configurations has been used in OSX, Debian and Ubuntu.

## Installation

### 1. Clone repository
```git clone git@github.com:ankr/dotfiles.git ~/.dotfiles```
> It's assumed that you clone into `~/.dotfiles`

### 2. Link dotfiles
```
$ .~/.dotfiles/link.sh
Setup symbolic link for ~/.bash_profile
Setup symbolic link for ~/.gitconfig
Setup symbolic link for ~/.inputrc
Setup symbolic link for ~/.screenrc
Setup symbolic link for ~/.vimrc
```

### 4. Setup up `~/.dotfiles/git_custom`
```
[user]
	name = <Your name>
	email = <Your email>
[github]
	user = <Your username>
```

### 5. Add custom stuff to `~/.dotfiles/bash_custom`
Add your personal aliases and other stuff in here.

## Atom Editor
In order to install settings for Atom editor, execute this in a shell.
```
ln -si ~/.dotfiles/atom/* ~/.atom/
```

## Sublime Text 3
In order to install settings for Sublime Text 3 editor, execute this in a shell.
```
ln -si ~/.dotfiles/sublime/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
```
