#!/bin/sh
#

# variables
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# autostart
#

# enable 75hz refresh rate
xrandr --output DisplayPort-1 --mode 3440x1440 --rate 75.05

# enable natural scrolling
# xinput set-prop 13 272 1
xinput --set-prop 13 "libinput Natural Scrolling Enabled" 1

# start compton, & necessary since the background option is bugged
# allow_rgb10_configs=false compton --config ~/.config/compton/compton.conf &
compton --config ~/.config/compton/compton.conf &

# set background
sh ~/.fehbg

# set up audio
mpd
mpDris2 &
pulseaudio --start
# mpd-notification &

# start session
exec i3 
