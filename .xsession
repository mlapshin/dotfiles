[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

syndaemon -k -i 1 -d &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet --sm-disable &             # assuming you're using Network Manager
thunar --daemon &
# gnome-power-manager &   # for laptops and stuff
# syndaemon -d -i 1 -t -k
# synclient touchpadoff=0
# ssh-agent
urxvtd &

# dropbox start

# xrandr --output LVDS1 --primary --output VGA1 --auto --right-of LVDS1
exec awesome            # awesome receives xinit's process id; when it terminates, X will be terminated
