vimrc:
	ln -rsf .vimrc ~/.vimrc
	ln -rsf .ideavimrc ~/.ideavimrc
tmux:
	ln -rsf .tmux.conf ~/.tmux.conf
	ln -rsf ./tmux_dev.sh ~/tmux_dev.sh
neovim:
	# ln -rsf config/nvim/init.vim ~/.config/nvim/init.vim
	# ln -rsf config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
	mkdir -p ~/.config/nvim/lua
	ln -rsf config/nvim/init.lua ~/.config/nvim/init.lua
	ln -rs config/nvim/lua/user ~/.config/nvim/lua
hyper:
	ln -rsf .hyper.js ~/.hyper.js
vscode:
	ln -rsf config/Code/User/settings.json ~/.config/Code/User/settings.json
alacritty:
	ln -rsf .alacritty.yml ~/.alacritty.yml
zsh-mac:
	ln -rsf .zshrc-mac ~/.zshrc
