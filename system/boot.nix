{ pkgs, ...}: 
{
    # Use Grub as bootloader   
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
    systemd.user.services.mountDevices = {
        description = "Mounts /dev/sdb and /dev/nvme0n1p1";
        serviceConfig.PassEnvironment = "DISPLAY";
        script = ''
        mount /dev/nvme0n1p1 /boot
        mount /dev/sda1 ~/files

        '';
        wantedBy = [ "multi-user.target" ]; # starts after login
    };
}