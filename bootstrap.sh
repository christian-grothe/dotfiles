#! /bin/bash

install_nvim(){
	wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	sudo chmod u+x nvim-linux-x86_64.appimage
	sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
}

install_dependencies(){
	local deps=(
		stow
		curl
		git
    tmux
    neofetch
    gcc
    hyprland
    hyprpaper
    waybar
    wofi
	)

	for pkg in "${deps[@]}"; do
		sudo dnf install -y "$pkg"
	done
}

install_dotfiles(){
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	git clone https://github.com/christian-grothe/dotfiles.git
	cd dotfiles
	stow .
  cd 
} 

install_ghostty(){
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
}


install_nvm(){
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
}

install_rust(){
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install_docker(){
  sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
  sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo systemctl enable --now docker

  sudo groupadd docker
  sudo usermod -aG docker "$USER"
  newgrp docker
}

#install_dependencies 
#install_nvm
#install_rust
#install_docker
#install_dotfiles
#install_ghostty
#install_nvim
