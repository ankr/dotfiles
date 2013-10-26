# dotfiles

My dot files. Their contents is brought together from all parts of the internet!

## Installation

Look here for the [installation of Sublime Text settings](https://github.com/ankr/dotfiles/sublime).

### 1. Clone repository
```git clone git@github.com:ankr/dotfiles.git ~/.dotfiles```
> You have to clone into `~/.dotfiles`

### 2. Make script executeable
```chmod -x setup.sh```

### 3. Run setup script
```
$ sh ./setup.sh
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
