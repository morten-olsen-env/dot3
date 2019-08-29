HISTTIMEFORMAT="%d/%m/%y %T "
export HOMEBREW_NO_ANALYTICS=1
ROOTPATH="$(dirname $(readlink ~/.zshrc))"
source $ROOTPATH/.zshrc

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi


# added by travis gem
[ -f /home/morten/.travis/travis.sh ] && source /home/morten/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

