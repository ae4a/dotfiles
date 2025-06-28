default: bar

bar:
	eww close-all
	./.config/eww/launch_bar.sh
	eww logs
