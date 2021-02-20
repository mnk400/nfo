install : 	
		@chmod +x nfo
		@mkdir ~/.config/nfo
		@cp art.sh ~/.config/nfo
		@cp config.conf ~/.config/nfo
		@sudo cp nfo /usr/local/bin

uninstall : 
		@rm -r ~/.config/nfo
		@sudo rm /usr/local/bin/nfo

reinstall : 
		@rm -r ~/.config/nfo
		@sudo rm /usr/local/bin/nfo
		@mkdir ~/.config/nfo
		@cp art.sh ~/.config/nfo
		@cp config.conf ~/.config/nfo
		@sudo cp nfo /usr/local/bin
