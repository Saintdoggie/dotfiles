init:
	mkdir .config
	mkdir .config/nixpkgs
	mkdir .config/nixpkgs/home-manager

	mkdir .config/hypr

dotfiles:
	cp dotfiles/hyprland.conf ~/.config/hypr/hyprland.conf
	cp dotfiles/neofetch.conf ~/.config/neofetch/config.conf
	cp dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml


system: dotfiles
	sudo cp configuration.nix /etc/nixos/configuration.nix

home-manager: system
	cp home.nix ~/.config/nixpkgs/home.nix
	
	cp home-manager/packages.nix ~/.config/nixpkgs/home-manager/packages.nix
	cp home-manager/program-configs.nix ~/.config/nixpkgs/home-manager/program-configs.nix


update: home-manager
	sudo nixos-rebuild switch
	home-manager switch

