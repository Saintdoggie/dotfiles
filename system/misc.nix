{ pkgs, ...}: 
{
    #linux kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;
    
    #sound
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    #printing
    services.printing.enable = true;

    #networking

    networking.hostName = "MrComputer"; # Define your hostname.

    networking.networkmanager.enable = true;  

    # Set time zone.
    time.timeZone = "America/Chicago";
    
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
}