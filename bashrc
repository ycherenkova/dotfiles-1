
# This tests if the $SSH_CONNECTION variable is empty, if so we probably don't
# want to use powerline over ssh, as it might look funny
if [ -z "$SSH_CONNECTION" ]; then
  . /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh
fi

if [ -n "$DISPLAY" ]; then
  xmodmap -e 'clear lock' -e 'keycode 0x42 = Escape'
fi

bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set completion-display-width 2"

alias gcp="git commit -am 'Alias Commit'"
alias tmux="tmux -2"

# Pacman alias examples
alias pacupg='sudo pacman -Syu'   # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl='pacman -Sw'    # Download specified package(s) as .tar.xz ball
alias pacin='sudo pacman -S'    # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'   # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'    # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'   # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'   # Display information about a given package in the repositories
alias pacreps='pacman -Ss'    # Search for package(s) in the repositories
alias pacloc='pacman -Qi'   # Display information about a given package in the local database
alias paclocs='pacman -Qs'    # Search for package(s) in the local database
alias paclo="pacman -Qdt"   # List all packages which are orphaned
alias pacc="sudo pacman -Scc"   # Clean cache - delete all the package files in the cache
alias paclf="pacman -Ql"    # List all files installed by a given package
alias pacown="pacman -Qo"   # Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp" # Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep" # Mark one or more installed packages as non explicitly installed

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
