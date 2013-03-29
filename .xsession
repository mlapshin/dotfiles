#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -f ~/.Xresources.$HOSTNAME ]; then
    xrdb -merge ~/.Xresources.$HOSTNAME
fi

syndaemon -k -i 1 -d &
urxvtd &

if [ $HOSTNAME = "rusty" ]; then
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  nm-applet --sm-disable &
  thunar --daemon &
  dunst &
  xrandr --addmode VGA1 1366x768
  ~/.dropbox-dist/dropbox &
else
  # medapp ws
  gnome-settings-daemon &
  nm-applet &
  source ~/.rvm/scripts/rvm
  dropbox start
fi

# dropbox start

# disable x screen blanking
xset s 0
xset s noblank
xset -dpms

erb  ~/.i3/config.erb > ~/.i3/config

exec i3
