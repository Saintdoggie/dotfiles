init:
	mkdir ~/.config/nixpkgs/home-manager
	
	mkdir ~/.config/kitty

	mkdir ~/.config/hypr
	mkdir ~/.config/neofetch
	mkdir ~/.config/kitty

config:
	cp -r configs/hypr/ ~/.config/
	cp configs/neofetch.conf ~/.config/neofetch/config.conf
	cp -r configs/kitty ~/.config/
	cp -r configs/waybar/ ~/.config/
	cp -r configs/zsh/.p10k.zsh ~/.p10k.zsh
	cp -r configs/wofi ~/.config

system:  config
	sudo cp system/configuration.nix /etc/nixos/configuration.nix

	sudo cp system/boot.nix /etc/nixos/boot.nix
	sudo cp system/graphics.nix /etc/nixos/graphics.nix
	sudo cp system/misc.nix /etc/nixos/misc.nix
	sudo cp system/nvidia.nix /etc/nixos/nvidia.nix
	sudo cp system/users.nix /etc/nixos/users.nix


home-manager: system
	cp home/home.nix ~/.config/nixpkgs/home.nix
	
	cp home/packages.nix ~/.config/nixpkgs/home-manager/packages.nix
	cp home/program-configs.nix ~/.config/nixpkgs/home-manager/program-configs.nix


update: home-manager
	sudo nixos-rebuild switch
	home-manager switch
		
	hyprctl keyword windowrule "workspace unset,kitty"
	hyprctl keyword windowrule "workspace unset,brave"
	hyprctl keyword windowrule "workspace unset,prismlauncher"
	hyprctl keyword windowrule "workspace unset,kitty"
	hyprctl keyword windowrule "workspace unset,discord"

	nix-collect-garbage


