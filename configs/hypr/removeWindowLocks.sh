sleep 10
hyprctl keyword windowrule "workspace unset,kitty"
hyprctl keyword windowrule "workspace unset,brave"
hyprctl keyword windowrule "workspace unset,prismlauncher"
hyprctl keyword windowrule "workspace unset,kitty"


sleep 10
hyprctl keyword windowrule "workspace unset,discord"


echo doRemoveWindowLocksFast > ~/.config/hypr/removeWindowLocksSettings