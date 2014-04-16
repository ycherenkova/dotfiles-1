

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
if [ -z "$SSH_CONNECTION" ]; then
  . ~/powerline/bindings/bash/powerline.sh
fi

export TERM=xterm-256color
export EDITOR=vim
