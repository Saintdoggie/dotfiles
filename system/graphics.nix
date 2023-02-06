{ pkgs, ...}: 
{
    
    security.polkit.enable = true;
    #nvidia driver stuff
    
    nixpkgs.config.allowUnfree = true;

    nixpkgs.config.permittedInsecurePackages = [
        "electron-12.2.3"
    ];

    
    services.xserver.layout = "us";

    
    xdg = {
        mime.enable = true;
    };


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
}