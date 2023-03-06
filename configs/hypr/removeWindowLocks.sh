sleep 10
hyprctl keyword windowrule "workspace unset,spotify"
hyprctl keyword windowrule "workspace unset,brave"
hyprctl keyword dispatch fakefullscreen
hyprctl keyword windowrule "workspace unset,prismlauncher"
hyprctl keyword windowrule "workspace unset,kitty"
hyprctl keyword windowrule "workspace unset,codium"




sleep 10
hyprctl keyword windowrule "workspace unset,discord"


echo doRemoveWindowLocksFast > ~/.config/hypr/removeWindowLocksSettings