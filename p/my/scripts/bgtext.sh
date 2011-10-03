#!/usr/bin/env bash

CMD='echo Hello world!'
BGCOLOR=transparent
FGCOLOR=white
FONT_SIZE=24
BG_SRC=~/graphics/wallpapers/coffee_beans-HD.jpg
FONT=Liberation-Mono-Regular
SIZE="1920x1080^"

eval "$CMD" | convert -font "$FONT" -background "$BGCOLOR" -pointsize $FONT_SIZE -fill "$FGCOLOR" label:@- overlay_text.png

composite overlay_text.png '(' $BG_SRC -resize "$SIZE" ')' -gravity south wallpaper.png