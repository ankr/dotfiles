# dotfiles

My dot files. Their contents is brought together from all parts of the internet!

## Installation

### 1. Clone repository
Clone this repo into any location on your mac

Ex.
```git clone git@github.com:ankr/dotfiles.git ~/dotfiles```

### 2. Make script executeable
```chmod -x setup.sh```

### 3. Run setup script
```
$ sh setup.sh
Setup symbolic link for ~/.bash_profile
Setup symbolic link for ~/.gitconfig
Setup symbolic link for ~/.screenrc
Setup symbolic link for ~/.vimrc
```

### 4. Make your custom changes, like setting up ~/.gitconfig
```
[user]
	name = <Your name>
	email = <Your email>
[github]
	user = <Your username>
```

### 5. Add your custom stuff
Add stuff into the `custom` folder
