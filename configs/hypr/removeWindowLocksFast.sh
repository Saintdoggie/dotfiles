settings=$(cat ~/.config/hypr/removeWindowLocksSettings)


if [ $settings = "doRemoveWindowLocksFast" ]
then
    hyprctl keyword windowrule "workspace unset,kitty"
    hyprctl keyword windowrule "workspace unset,firefox"
    hyprctl keyword windowrule "workspace unset,prismlauncher"
    hyprctl keyword windowrule "workspace unset,kitty"
    hyprctl keyword windowrule "workspace unset,discord"

fi

