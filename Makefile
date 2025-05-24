default: picom bar

picom:
	@stow .
	killall picom
	picom &

bar:
	@stow .
	@~/.config/polybar/launch.sh &

