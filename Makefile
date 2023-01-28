init:
	mkdir ~/.config/nixpkgs/home-manager
	
	mkdir ~/.config/kitty

	mkdir ~/.config/hypr
	mkdir ~/.config/neofetch
	mkdir ~/.config/kitty

config:
	cp -r ~/files/dotfiles/nixOS-dotfiles/dotfiles/hypr/ ~/.config/
	cp ~/files/dotfiles/nixOS-dotfiles/dotfiles/neofetch.conf ~/.config/neofetch/config.conf
	cp -r ~/files/dotfiles/nixOS-dotfiles/dotfiles/kitty ~/.config/
	cp -r ~/files/dotfiles/nixOS-dotfiles/dotfiles/waybar/ ~/.config/
	cp -r ~/files/dotfiles/nixOS-dotfiles/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

system:  config
	sudo cp main-configs/configuration.nix /etc/nixos/configuration.nix

home-manager: system
	cp main-configs/home.nix ~/.config/nixpkgs/home.nix
	
	cp home-manager/packages.nix ~/.config/nixpkgs/home-manager/packages.nix
	cp home-manager/program-configs.nix ~/.config/nixpkgs/home-manager/program-configs.nix


update: home-manager
	sudo nixos-rebuild switch
	home-manager switch
	nix-collect-garbage

