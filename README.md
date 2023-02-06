# NixOS Configs

To install, run

```
git clone https://github/Saintdoggie/nixOS-dotfiles
make init
make update
```

## Applications
* Zsh as the shell.
* Home-manager for User Management.
* Hyprland as the Window Manager.
* Rofi as the Application launcher.

## Warning
* You WILL need to modify the makefile as some of the ways I do things are hacky and probably don't work on your system
* if you want this for the Hyprland configs, just take those ones instead of doing the work to port everything to your system
* You may need to do the following:
    * check the makefile, look at all file paths and modify them for you
    * modify users in ![system/users.nix](https://github.com/Saintdoggie/NixOS-configs/blob/main/system/users.nix)
    * replace wallpapers in ![configs/hypr/hyprpaper.conf](https://github.com/Saintdoggie/NixOS-configs/blob/main/configs/hypr/hyprpaper.conf)

## Config Credits
Rofi, Waybar and Hyprland configs are based on Chris Titus's and Linuxmobile's configs

![Image](https://github.com/Saintdoggie/NixOS-configs/blob/main/configs/screenshot.png?raw=true)