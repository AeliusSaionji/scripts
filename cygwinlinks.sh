#!/bin/sh
if [ $COMPUTERNAME != NERV ]; then
	cd /cygdrive/C/Users/Link/Github
	git clone https://github.com/Link-Satonaka/scripts.githttps://github.com/Link-Satonaka/scripts.git
	git clone https://github.com/Link-Satonaka/scripts.githttps://github.com/Link-Satonaka/dotfiles.git
	git clone https://github.com/Link-Satonaka/scripts.githttps://github.com/Link-Satonaka/practice.git
	read -n1 -r -p "Press any key to continue..." 
	cd ~
	ln -s /cygdrive/c/Users/Link/Github/dotfiles/home/Link/.config
	ln -s /cygdrive/c/Users/Link/Github/dotfiles/home/Link/.irssi
	ln -s /cygdrive/c/Users/Link/Github/dotfiles/home/Link/.zshrc
fi
