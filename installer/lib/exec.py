import os, sys
from termcolor import colored

class Execution:
    class obj:
        currentOutputCommand = 0

    def __init__(self):
        Execution.obj.currentOutputCommand = 0

    def exec(command):
        print(colored(f"executing", "green"), f"\"{command}\"")
        checks = os.system(f"{command} > installer/output/{Execution.obj.currentOutputCommand}")
        if (checks != 0):
            print(colored("Error... ", "red"), "exiting")
            sys.exit()
        Execution.obj.currentOutputCommand+=1
    
    list =  {
        "system": {
            "0": "sudo cp system/configuration.nix /etc/nixos/configuration.nix",
            "1": "sudo cp system/boot.nix /etc/nixos/boot.nix",
            "2": "sudo cp system/misc.nix /etc/nixos/misc.nix",
            "3": "sudo cp system/nvidia.nix /etc/nixos/nvidia.nix",
            "4": "sudo cp system/users.nix /etc/nixos/users.nix",
            "5": "sudo nixos-rebuild switch"
        },
        "home": {
            "0": "cp home/home.nix ~/.config/nixpkgs/home.nix",
            "1": "cp home/packages.nix ~/.config/nixpkgs/home-manager/packages.nix",
            "2": "cp home/program-configs.nix ~/.config/nixpkgs/home-manager/program-configs.nix",
            "3": "home-manager switch"
        },
        "configs": {
            "0": "cp -r configs/hypr/ ~/.config/",
            "1": "cp configs/neofetch.conf ~/.config/neofetch/config.conf",
            "2": "cp -r configs/kitty ~/.config/",
            "3": "cp -r configs/waybar/ ~/.config/",
            "4": "cp -r configs/zsh/.p10k.zsh ~/.p10k.zsh",
            "5": "cp -r configs/wlogout ~/.config/"
        },
        "clean": {
            "0": "nix-collect-garbage"
        }
    }

    class install:
        def system():
            for key, value in execution.list["system"].items():
                Execution.exec(str(value))
        def home():
            for key, value in execution.list["home"].items():
                Execution.exec(str(value))
        def configs():
            for key, value in execution.list["configs"].items():
                Execution.exec(str(value))

        def clean():
            for key, value in execution.list["clean"].items():
                Execution.exec(str(value))

execution = Execution()