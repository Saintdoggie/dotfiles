{ pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    
    #development tools
    pkgs.kitty
    pkgs.alacritty
    pkgs.qemu
    pkgs.vscode
    pkgs.jetbrains.idea-community
    pkgs.gnumake
    pkgs.sqlite
    pkgs.raylib
    pkgs.gcc


    #terminal cool stuff
    pkgs.neofetch
    pkgs.htop
    pkgs.btop

    #games
    pkgs.prismlauncher


    #gui cool things
    # pkgs.brave
    pkgs.pavucontrol
    pkgs.spotify
    pkgs.discord

    #important stuff for os
    pkgs.i2c-tools
    pkgs.wlogout
    pkgs.polkit
    pkgs.xdg-desktop-portal
    pkgs.lxde.lxsession


    #Hyprland stuff
    pkgs.xwayland
    pkgs.hyprpaper
    pkgs.rofi
    pkgs.grim
    pkgs.slurp
    pkgs.dunst
    pkgs.cava
    pkgs.playerctl
    pkgs.via
    pkgs.qmk
    #vpn stuff
    pkgs.protonvpn-cli
    pkgs.protonvpn-gui

    #virtual machine stuff
    pkgs.qemu
    pkgs.swtpm

    #HAcking stuff
    pkgs.nmap
    pkgs.wireshark
    pkgs.amass
    
    #fonts
    pkgs.meslo-lgs-nf
  ];
}