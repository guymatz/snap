#!/bin/bash

name=$0

RES=$(xrandr | grep '*' | tail -1 | awk '{print $1}')
W=$(echo $RES | cut -dx -f1)
HALF_W=$(echo "$W/2" | bc)
H=$(echo $RES | cut -dx -f2)
HALF_H=$(echo "$H/2" | bc)

CURRENT_TOP_Y=$(xwininfo -id $(xdotool getactivewindow) | grep 'Absolute upper-left Y' | cut -d: -f2 | sed 's/ //g' )
CURRENT_HEIGHT=$(xwininfo -id $(xdotool getactivewindow) | grep 'Height:' | cut -d: -f2 | sed 's/ //g' )
CURRENT_LEFT_X=$(xwininfo -id $(xdotool getactivewindow) | grep 'Absolute upper-left X' | cut -d: -f2 | sed 's/ //g' )
CURRENT_WIDTH=$(xwininfo -id $(xdotool getactivewindow) | grep 'Width:' | cut -d: -f2 | sed 's/ //g' )

if [[ $name =~ .*top-left$ ]]; then
  POS="0,0,0,${HALF_W},${HALF_H}"
elif [[ $name =~ .*top-right$ ]]; then
  POS="0,${HALF_W},0,${HALF_W},${HALF_H}"
elif [[ $name =~ .*bottom-left$ ]]; then
  POS="0,0,${HALF_H},${HALF_W},${HALF_H}"
elif [[ $name =~ .*bottom-right$ ]]; then
  POS="0,${HALF_W},${HALF_H},${HALF_W},${HALF_H}"
elif [[ $name =~ .*left$ ]]; then
  POS="0,0,0,${HALF_W},${H}"
elif [[ $name =~ .*right$ ]]; then
  POS="0,${HALF_W},0,${HALF_W},${H}"
elif [[ $name =~ .*top$ ]]; then
  POS="0,0,0,${W},${HALF_H}"
elif [[ $name =~ .*bottom$ ]]; then
  POS="0,0,${HALF_H},${W},${HALF_H}"
elif [[ $name =~ .*max* ]]; then
  POS="0,0,0,${W},${H}"
elif [[ $name =~ .*min* ]]; then
  POS="0,0,0,0,0"
elif [[ $name =~ .*full-height* ]]; then
  POS="0,${CURRENT_LEFT_X},0,${CURRENT_WIDTH},${H}"
elif [[ $name =~ .*full-width* ]]; then
  POS="0,0,${CURRENT_TOP_Y},${W},${CURRENT_HEIGHT}"
elif [[ $name =~ .*full ]]; then
  POS="0,0,0,${W},${H}"
fi

#echo $name $POS >> /tmp/snap.out
#echo $name $POS


wmctrl -r :ACTIVE: -e $POS 2>&1 >> /tmp/snap.out
  
  
