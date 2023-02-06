{ pkgs, ...}: {
  imports =
    [ 
      
      #include package list
      ./home-manager/packages.nix
      
      #include program configs
      ./home-manager/program-configs.nix
    ];

  home.stateVersion = "22.11";
  home.username = "liam";
  home.homeDirectory = "/home/liam";

}