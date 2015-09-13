bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set completion-display-width 2"

PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -n "$DISPLAY" ]; then
  xmodmap -e 'clear lock' -e 'keycode 0x42 = Escape'
fi

. ~/dotfiles/aliases

if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
  . /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi
