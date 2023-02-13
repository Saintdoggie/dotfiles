{ config, pkgs, lib, inputs, ... }: 
let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
  
  Python-packages = p: with p; [
    xlib  
    blessings
    # nextcord
    requests
    django

    discordpy
    python-dotenv
    # other python packages
  ];
in {
  imports = [

      #hardware config
      ./hardware-configuration.nix
      
      #boot config
      ./boot.nix

      #nvidia config
      ./nvidia.nix

      #misc configs
      ./misc.nix

      #users
      ./users.nix

      #graphics
      ./graphics.nix

      #enables hyprland
      hyprland.nixosModules.default

    ];
  services.xserver.displayManager.startx.enable = true;

  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.default;
  };


  nixpkgs.overlays = [
        (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        });
      })
  ];

  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["liam"];

  environment.etc = {
  # Creates /etc/nanorc
  issue = {
    text = ''
      MrComputer TTY Login
      -------------------
    '';
  };
};
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    (pkgs.python3.withPackages Python-packages)

    # programming and terminal applications
    pkgs.nano
    pkgs.wget
    pkgs.git
    
    pkgs.home-manager
    pkgs.virt-manager
    pkgs.gparted
    pkgs.jdk
    pkgs.gtop


    #games
    pkgs.python39
    pkgs.waybar

  ];
  
  fonts.fonts = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  nerdfonts
];
  # Enable ssh
  services.openssh.enable = true;
  

  system.stateVersion = "22.11";



}