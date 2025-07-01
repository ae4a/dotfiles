default: bar

bar:
	eww close-all
	./.config/eww/launch_bar.sh
	eww logs

volume:
	eww close volume-popup
	eww open volume-popup --screen 0
	eww logs
