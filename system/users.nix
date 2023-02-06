{ pkgs, ...}: 
{
  users.users.liam = {
        isNormalUser = true;
        extraGroups = [ "wheel"  "libvirtd"]; # Enable sudo and virtual machine access
        shell = pkgs.zsh;
    };
}