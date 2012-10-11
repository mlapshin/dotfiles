[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

syndaemon -k -i 1 -d &
urxvtd &

if [ "$HOSTNAME" -eq "rusty" ]; then
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  nm-applet --sm-disable &
  thunar --daemon &
else
  # medapp ws
  gnome-settings-daemon &
fi

# dropbox start

exec awesome
