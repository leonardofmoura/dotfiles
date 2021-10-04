#/usr/bin/env bash

function run {
    if ! pgrep -f $1;
    then 
        $@&
    fi
}

# Start the compositor
run picom

# Start network manager applet
run nm-applet

# Touchpad configuration
xinput set-prop "SYNA2B2C:01 06CB:7F27 Touchpad" "libinput Tapping Enabled" 1 #enable tapping
xinput set-prop "SYNA2B2C:01 06CB:7F27 Touchpad" "libinput Natural Scrolling Enabled" 1 #set natural scrolling
