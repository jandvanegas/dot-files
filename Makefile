gitbash:
	ln -rsf ./gitbash/.bashrc ~/.bashrc
	ln -rsf ./gitbash/.git_aliases ~/.git_aliases
	ln -rsf ./gitbash/.python_aliases ~/.python_aliases
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
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./terminal-playbook.yml --connection local --ask-become-pass
	@make terminal-gui

terminal-gui:
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./terminal-gui-playbook.yml --connection local --ask-become-pass

work:
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./work-playbook.yml --connection local --ask-become-pass

devops:
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./devops-playbook.yml --connection local --ask-become-pass

node:
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./node-playbook.yml --connection local --ask-become-pass

install-udevmon:
	echo "Running udevmon"
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./udevmon-playbook.yml --connection local --ask-become-pass

python:
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./python-playbook.yml --connection local --ask-become-pass

sign-dependencies:
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./sign/sign-playbook.yml --connection local --ask-become-pass

sign-vm:
	cd sign; sudo bash ./post-reboot.sh

sign-ubuntu:
	# WIP
	sudo sbsign --key /root/module-signing/MOK.priv --cert /root/module-signing/MOK.pem "$(in-core)" --output "$(output-core)"
	sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

jupyter-css:
	# to find out which one is the correct run import jupyter_core; jupyter_core.paths.jupyter_config_dir() 
	mkdir -p ~/.ipython/profile_default/static/custom
	ln -rsf ./.ipython/profile_default/static/custom/custom.css ~/.ipython/profile_default/static/custom/custom.css
	mkdir -p ~/.jupyter/custom
	ln -rsf ./.ipython/profile_default/static/custom/custom.css ~/.jupyter/custom/custom.css

playbook:
	~/custom-envs/ansible/bin/ansible-playbook playbooks/./${play}-playbook.yml --connection local --ask-become-pass
