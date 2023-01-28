{ pkgs, ...}: {

#terminal stuff
  programs.zsh = {
    enable = true;
    initExtra = "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh";

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    
  };

  programs.git = {
    enable = true;
    userName  = "Liam St. Ores";
    userEmail = "l@nklssjx.xyz.com";
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };
  
}