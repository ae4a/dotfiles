#!/bin/sh

xinitdir="/etc/X11/xinit"

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# "$twm" &
# "$xclock" -geometry 50x50-1+1 &
# "$xterm" -geometry 80x50+494+51 &
# "$xterm" -geometry 80x20+494-0 &
# exec "$xterm" -geometry 80x66+0+0 -name login

xrdb -merge ~/.Xresources

# xrandr --output eDP-1 --mode 1920x1200 --pos 1920x0 --output HDMI-1 --mode 1920x1080 --pos 0x0
xsetroot -cursor_name left_ptr
# xrandr --output eDP-1 --mode 1920x1200 --pos 2560x0 --output HDMI-1 --mode 2560x1440 --pos 0x0
xrandr --output eDP-1 --mode 1920x1200 --pos 320x1440 --output HDMI-1 --mode 2560x1440 --pos 0x0
# setxkbmap -option grp:alt_shift_toggle us,ru
exec bspwm
