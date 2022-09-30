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
upgrade-git:
	# https://www.linuxcapable.com/how-to-install-and-update-latest-git-on-ubuntu-20-04/
	sudo add-apt-repository ppa:git-core/ppa -y
	sudo apt update
	sudo apt upgrade git
ansible:
	mkdir -p ~/custom-envs
	if [ ! -d "~/custom-envs/ansible/bin" ]; then \
		cd ~/custom-envs; python3 -m venv ansible; \
	fi
	~/custom-envs/ansible/bin/pip install ansible
ansible-terminal: ansible
	~/custom-envs/ansible/bin/ansible-playbook ./terminal-playbook.yml --connection local --ask-become-pass
	@make terminal-gui

terminal-gui:
	~/custom-envs/ansible/bin/ansible-playbook ./terminal-gui-playbook.yml --connection local --ask-become-pass

work:
	~/custom-envs/ansible/bin/ansible-playbook ./work-playbook.yml --connection local --ask-become-pass

node:
	~/custom-envs/ansible/bin/ansible-playbook ./node-playbook.yml --connection local --ask-become-pass

install-udevmon:
	echo "Running udevmon"
	~/custom-envs/ansible/bin/ansible-playbook ./udevmon-playbook.yml --connection local --ask-become-pass

python:
	~/custom-envs/ansible/bin/ansible-playbook ./python-playbook.yml --connection local --ask-become-pass

