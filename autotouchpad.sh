#! /bin/bash

#Credits:
#Display, user, user id detection and notification trigger: Fabio A. https://stackoverflow.com/a/49533938
#Credit for the touchpad ID detection from xinput: Unknown/forgotten. Sorry!

## OPTIONAL:
timeout=5000    # In milliseconds
urgency=normal  # Low, normal, critical

## INIT
#Detect the name of the display in use
display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"
#Detect the user using such display
user=$(who | grep '('$display')' | awk '{print $1}' | head -n 1)
#Detect the id of the user
uid=$(id -u $user)
echo "Autotouchpad: Display$display for $user (UID $uid)"
#Export display and .Xauthority
export DISPLAY=$display
export XAUTHORITY="/home/$user/.Xauthority"

#Controls

function touchpad_control() {
    #Obtain touchpad ID from xinput
    touchpad_id=$(xinput list | grep -F 'ouchpad' | grep -Po '(?<=id=)\d\d?') # Finds device ID of touchpad
    echo "Autotouchpad: Sending \"$1\" to xinput device $touchpad_id."
    xinput $1 $touchpad_id;
    #Notification handling
    echo "Autotouchpad: Sending notification via notify-send."
    su $user -c "DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send -a \"Autotouchpad\" -u $urgency -t $timeout \"Touchpad $1d\""
    echo "Autotouchpad: Toggling done."
}

## Startup and triggering
if [ "$1" = "startup" ]; then #System start
    echo "Autotouchpad: Obtaining list of USB mice from xinput."
    mouse_list=`xinput list | grep -i 'USB.*mouse'` #Finds device ID of USB mouse
    echo "Autotouchpad: Found ${#mouse_list} USB mice"
    if [ ${#mouse_list} -eq 0 ]; then
        echo "Autotouchpad: No USB mice found, enabling touchpad."
        touchpad_control "enable"
    else
        echo "Autotouchpad: USB mice found, disabling touchpad."
        touchpad_control "disable"
    fi
else
    touchpad_control $1
fi
