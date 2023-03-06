import os, sys

import time


def main():
    os.system("echo -e 'Hypixel\nKareAkern\nOther' | bemenu  -m DP-1 > ~/.config/hypr/scripts/output")



    output = open('.config/hypr/scripts/output', 'r').read()
    
    if (output == "Hypixel\n"):
        os.system("prismlauncher -l 1.8.9 -s hypixel.net &")

        time.sleep(9)

        os.system("hyprctl dispatch movetoworkspace 3,Minecraft 1.8.9")
        os.system("hyprctl dispatch fullscreen 0")

    if (output == "KareAkern\n"):
        os.system("prismlauncher -l 1.19.3 -s kareakern.mine.bz &")

        time.sleep(13)

        os.system("hyprctl dispatch movetoworkspace 3,'Minecraft'")
        os.system("hyprctl dispatch fullscreen 0")

    else:
        print("error")


main()