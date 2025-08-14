#!/bin/sh

BIND="Space"
TITLE="Stardew Valley"
PAT="s/activewindow>>(.+),.*/\1/p"
ACTIVE=false

trap 'hyprctl keyword unbind , "$BIND"' EXIT

handle() {
  ACTIVE_WINDOW="$(echo "$1" | sed -rn "$PAT")"
  if [ -z "$ACTIVE_WINDOW" ]; then return; fi
  if [ "$ACTIVE_WINDOW" = "$TITLE" ]; then
    hyprctl keyword bind , $BIND, exec, "hyprctl --batch 'dispatch sendkeystate , Shift_R, down, title:$TITLE ; dispatch sendkeystate , r, down, title:$TITLE ; dispatch sendkeystate , delete, down, title:$TITLE' ; sleep 0.01 ; hyprctl --batch 'dispatch sendkeystate , Shift_R, up, title:$TITLE ; dispatch sendkeystate , r, up, title:$TITLE ; dispatch sendkeystate , delete, up, title:$TITLE'"
    ACTIVE=true
  elif [ "$ACTIVE" = true ]; then
    hyprctl keyword unbind , $BIND
    ACTIVE=false
  fi
}

nc -U "$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
