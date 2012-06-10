# Dotfiles
This is my dotfiles repo containing all my configuration files.
Currently I haven't added all config files but will continue to do so
when I have the time.

# Installing
Clone the repo into some folder:

	git clone <address to repo> <dest folder>

When in your home folder, create symlinks to the config files:

	ln -s <full path to dest folder>/vim .vim
	ln -s <full path to dest folder>/vim/vimrc .vimrc
	ln -s <full path to dest folder>/tmux/tmux.conf .tmux.conf
	ln -s <full path to dest folder>/bash_aliases .bash_aliases
	ln -s <full path to dest folder>/bash_ps1 .bash_ps1
	ln -s <full path to dest folder>/bashrc .bashrc

# vim specifics
In order to get all plugins installed when the repo is newly cloned,
just do:

	cd vim
	./bootstrap.sh


