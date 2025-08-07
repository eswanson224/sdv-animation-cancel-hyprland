trap "hyprctl keyword unbind , Space" EXIT
hyprctl keyword bind , Space, exec, 'hyprctl --batch "dispatch sendkeystate , Shift_R, down, title:Stardew Valley ; dispatch sendkeystate , r, down, title:Stardew Valley ; dispatch sendkeystate , delete, down, title:Stardew Valley" ; sleep 0.01 ; hyprctl --batch "dispatch sendkeystate , Shift_R, up, title:Stardew Valley ; dispatch sendkeystate , r, up, title:Stardew Valley ; dispatch sendkeystate , delete, up, title:Stardew Valley"'
while true; do sleep 500; done
