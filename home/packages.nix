{ pkgs, ...}: 
{
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    
    #development tools
    pkgs.kitty
    pkgs.alacritty
    pkgs.qemu
    pkgs.vscodium
    pkgs.jetbrains.idea-community
    pkgs.gnumake
    pkgs.sqlite
    pkgs.raylib
    pkgs.gcc
    pkgs.ripgrep
    pkgs.fd
    pkgs.android-tools
    pkgs.killall
    pkgs.xmrig
    pkgs.imagemagick
    pkgs.podman
    pkgs.distrobox
    pkgs.docker




    #themes
    pkgs.nordic
    pkgs.sweet

    #terminal cool stuff
    pkgs.neofetch
    pkgs.htop
    pkgs.btop

    #games
    pkgs.prismlauncher

    #gui cool things
    pkgs.brave
    pkgs.pavucontrol
    pkgs.spotify
    pkgs.ncspot
    pkgs.monero-gui

    pkgs.discord

    #important stuff for os
    pkgs.i2c-tools
    pkgs.wlogout
    pkgs.polkit
    pkgs.xdg-desktop-portal
    pkgs.lxde.lxsession
    pkgs.neovim
    #Hyprland stuff
    
    pkgs.pipewire
    pkgs.wireplumber
    pkgs.xwayland
    pkgs.hyprpaper
    pkgs.grim
    pkgs.dunst
    pkgs.cava
    pkgs.playerctl
    pkgs.via
    pkgs.qmk
    pkgs.opentabletdriver
    pkgs.xfce.thunar
    pkgs.oguri
    pkgs.bemenu
    pkgs.eww-wayland
    pkgs.wmctrl
    
    pkgs.arc-theme
    pkgs.nordic

    
    #vpn stuff
    pkgs.protonvpn-cli
    pkgs.protonvpn-gui
    pkgs.wireguard-tools
    pkgs.openvpn



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