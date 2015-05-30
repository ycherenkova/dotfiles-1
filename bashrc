
# .xsession-errors can grow huge... remove it
#if [ ! -h $HOME/.xsession-errors ]
#then
  #/bin/rm $HOME/.xsession-errors
  #ln -s /dev/null $HOME/.xsession-errors
#fi
#if [ ! -h $HOME/.xsession-errors.old ]
#then
  #/bin/rm $HOME/.xsession-errors.old
  #ln -s /dev/null $HOME/.xsession-errors.old
#fi

# This tests if the $SSH_CONNECTION variable is empty, if so we probably don't
# want to use powerline over ssh, as it might look funny
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -z "$SSH_CONNECTION" ]; then
  #. ${HOME}/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
  . /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh
fi

if [ -n "$DISPLAY" ]; then
  xmodmap -e 'clear lock' -e 'keycode 0x42 = Escape'
fi
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set completion-display-width 2"
export ANDROID_SDK="${HOME}/AndroidSDK/sdk"
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_NDK="${HOME}/AndroidNDK"
export PATH="$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$ANDROID_NDK"

# Settings this breaks CMUS colors
export EDITOR=vim
export ECLIPSE_HOME="${HOME}/AndroidSDK/eclipse"
export NDKROOT=$ANDROID_NDK

export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PATH=$PATH:${GOPATH}/bin

export CLASSPATH=$CLASSPATH:/usr/local/lib/kawa.jar

alias cdgo="cd ~/go"
alias gcp="git commit -am 'Alias Commit'"
alias tmux="tmux -2"
alias cdschool="cd ~/Dropbox/School/fall2014/"
