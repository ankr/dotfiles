# dotfiles

My dot files. Their contents is brought together from all parts of the internet.

## About
This repository contains configuration files to make your life in the terminal a lot better. Checkout the `files` directory to what is actually going on.

*These configurations has been used in OSX, Debian and Ubuntu.*

## Installation

### 1. Clone repository
```git clone git@github.com:ankr/dotfiles.git ~/.dotfiles```
> It's assumed that you clone into `~/.dotfiles`

### 2. Link dotfiles
```
$ ~/.dotfiles/install.sh
Setup symbolic link for ~/.bashrc
Setup symbolic link for ~/.gitconfig
etc ...
```

### 4. Setup up `~/.dotfiles/custom/gitconfig`
```
[user]
	name = <Your name>
	email = <Your email>
[github]
	user = <Your username>
```

### 5. Add custom stuff to `~/.dotfiles/custom/bashrc`
Add your personal aliases and other stuff in here.

```bash
export DOTFILES_EMAIL="your@email.com" # Used for bin/backup.sh
```
