vimrc:
	ln -rsf .vimrc ~/.vimrc
	ln -rsf .ideavimrc ~/.ideavimrc
tmux:
	ln -rsf .tmux.conf ~/.tmux.conf
neovim:
	# ln -rsf config/nvim/init.vim ~/.config/nvim/init.vim
	# ln -rsf config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
	mkdir -p ~/.config/nvim/lua/user
	ln -rsf config/nvim/init.lua ~/.config/nvim/init.lua
	ln -rsf config/nvim/lua/user/options.lua ~/.config/nvim/lua/user/options.lua
	ln -rsf config/nvim/lua/user/keymaps.lua ~/.config/nvim/lua/user/keymaps.lua
	ln -rsf config/nvim/lua/user/plugins.lua ~/.config/nvim/lua/user/plugins.lua
	ln -rsf config/nvim/lua/user/colorschemes.lua ~/.config/nvim/lua/user/colorschemes.lua
	ln -rsf config/nvim/lua/user/cmp.lua ~/.config/nvim/lua/user/cmp.lua
hyper:
	ln -rsf .hyper.js ~/.hyper.js
vscode:
	ln -rsf config/Code/User/settings.json ~/.config/Code/User/settings.json
alacritty:
	ln -rsf .alacritty.yml ~/.alacritty.yml
