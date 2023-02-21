{ pkgs, ...}: 
{
  users.users.liam = {
        isNormalUser = true;
        extraGroups = [ "wheel"  "libvirtd" "docker"]; # Enable sudo and virtual machine access
        shell = pkgs.zsh;
    };
}