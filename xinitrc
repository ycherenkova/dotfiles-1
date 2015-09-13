#!bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap dvorak

/usr/bin/xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &

#urxvt -e bash -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session" &
terminator -e "tmux -2" &

xset -dpms &
xset s 3600 3600 &

xbindkeys
exec awesome
