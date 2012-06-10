# Dotfiles
This is my dotfiles repo containing all my configuration files.
Currently I haven't added all config files but will continue to do so
when I have the time.

# Installing
Assuming you're in your home folder, clone the repo:

	git clone git://github.com/Meldanya/dotfiles.git

Create symlinks to the config files:

	ln -s ~/dotfiles/vim .vim
	ln -s ~/dotfiles/vim/vimrc .vimrc
	ln -s ~/dotfiles/tmux/tmux.conf .tmux.conf
	ln -s ~/dotfiles/bash_aliases .bash_aliases
	ln -s ~/dotfiles/bash_ps1 .bash_ps1
	ln -s ~/dotfiles/bashrc .bashrc

# vim specifics
In order to get all plugins installed when the repo is newly cloned,
just do:

	cd vim
	./bootstrap.sh

