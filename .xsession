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
else
  # medapp ws
  gnome-settings-daemon &
fi

# dropbox start
~/.dropbox-dist/dropbox &

if [ $HOSTNAME = "rusty" ]; then
    exec i3
else
    exec i3 --force-xinerama
fi
