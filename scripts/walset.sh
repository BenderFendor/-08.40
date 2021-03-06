#!/usr/bin/env bash
	#
	# Script to set colors generated by 'wal'
	# https://github.com/dylanaraps/wal

	# Source generated colors.
	source "${HOME}/.cache/wal/colors.sh"

	reload_dunst() {
	    pkill dunst
	    dunst \
	        -lb "${color0:-#F0F0F0}" \
	        -nb "${color0:-#F0F0F0}" \
	        -cb "${color0:-#F0F0F0}" \
	        -lf "${color15:=#000000}" \
	        -bf "${color15:=#000000}" \
	        -cf "${color15:=#000000}" \
	        -nf "${color15:=#000000}" \
	        -fn "${DUNST_FONT:-Artwiz Lemon 7}" \
	        -geometry "${DUNST_SIZE:-300x30-40+70}" &
	}

	reload_openbox() {
	    sed -i"" \
	        -e "s/bg.color: #.*/bg.color: ${color7:-#FFFFFF}/" \
	        -e "s/text.color: #.*/text.color: ${color0:-#000000}/" \
	        -e "s/image.color: #.*/image.color: ${color0:-#000000}/" \
	        "${HOME}/.themes/flex/openbox-3/themerc"
	    openbox --reconfigure
	}

	main() {
	    reload_openbox &
	    reload_dunst &
	}

	main
