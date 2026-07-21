#!/bin/bash

selection=$(find ~/ \
	-wholename '/home/julia/.cache' -prune -o \
	-wholename '/home/julia/.local' -prune -o \
	-wholename '/home/julia/MATLAB' -prune -o \
	-wholename '/home/julia/.MathWorks' -prune -o \
	-wholename '/home/julia/V/Keyboard/qmk_firmware' -prune -o \
	-wholename '/home/julia/Downloads/matlab' -prune -o \
	-type f \
	-print \
	| fzf)
hyprctl dispatch exec xdg-open "$selection"
