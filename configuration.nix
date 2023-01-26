{ config, pkgs, lib, inputs, ... }: 
let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
  
  Python-packages = p: with p; [
    xlib  
    blessings
    nextcord
    requests
    # other python packages
  ];
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      hyprland.nixosModules.default

    ];

	  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      efiSupport = true;
    };
  };  

 environment = {
    variables = {
      NIXOS_OZONE_WL = "1";
      GBM_BACKEND = "nvidia-drm";
      __GL_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
      DISABLE_QT5_COMPAT = "0";
      ANKI_WAYLAND = "1";
      DIRENV_LOG_FORMAT = "";
      WLR_DRM_NO_ATOMIC = "1";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      # QT_QPA_PLATFORMTHEME = "qt5ct";
      MOZ_ENABLE_WAYLAND = "1";
      WLR_BACKEND = "vulkan";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_SESSION_TYPE = "wayland";
      CLUTTER_BACKEND = "wayland";
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    };
    
  };



  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "MrComputer"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Set your time zone.
  time.timeZone = "America/Chicago";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # setup GUI stuff
  services.xserver = {
    enable = true;

    libinput = {
      enable = true;
    };
  };

  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["liam"];

  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager = {
    xmonad.enable = true;
    xmonad.enableContribAndExtras = true;
    xmonad.extraPackages = hpkgs: [
      hpkgs.xmonad
      hpkgs.xmonad-contrib
      hpkgs.xmonad-extras
    ];
  };
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
  security.polkit.enable = true;
  #nvidia driver stuff
  
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
      ];
    };


    # nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidia = {
      open = true;
      modesetting.enable = true;
    };
  };
  
  
  services.xserver.layout = "us";


  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.liam = {
     isNormalUser = true;
     extraGroups = [ "wheel"  "libvirtd"]; # Enable sudo and virtual machine access
     shell = pkgs.zsh;

  };
  xdg = {
      mime.enable = true;
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
    pkgs.gparted
    pkgs.jdk
    pkgs.gtop
    pkgs.flameshot
    
    #themes
    pkgs.nordic

    #games
    pkgs.python39


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

  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11";



}