settings=$(cat ~/.config/hypr/removeWindowLocksSettings)


if [ $settings = "doRemoveWindowLocksFast" ]
then
    hyprctl keyword windowrule "workspace unset,kitty"
    hyprctl keyword windowrule "workspace unset,brave"
    hyprctl keyword windowrule "workspace unset,prismlauncher"
    hyprctl keyword windowrule "workspace unset,kitty"
    hyprctl keyword windowrule "workspace unset,discord"
    hyprctl keyword windowrule "workspace unset,obs"
    hyprctl keyword windowrule "workspace unset,codium"



fi

