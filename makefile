install : 	
		@mkdir /home/${USER}/.config/nfo
		@cp art.sh /home/${USER}/.config/nfo
		@cp config.conf /home/${USER}/.config/nfo
		@sudo cp nfo /usr/local/bin

uninstall : 
		@rm -r /home/${USER}/.config/nfo
		@sudo rm /usr/local/bin/nfo

reinstall : 
		@rm -r /home/${USER}/.config/nfo
		@sudo rm /usr/local/bin/nfo
		@mkdir /home/${USER}/.config/nfo
		@cp art.sh /home/${USER}/.config/nfo
		@cp config.conf /home/${USER}/.config/nfo
		@sudo cp nfo /usr/local/bin