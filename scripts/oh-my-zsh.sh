function get_env() {
  echo "
export ZSH=\"$INSTALL_PATH/git\"
plugins=(
  git
)
export ZSH_THEME=\"bira\"
export ZSH_CUSTOM=\"$INSTALL_PATH/custom\"
source \"\$ZSH/oh-my-zsh.sh\"
  "
}

function do_install() {
  git clone "https://github.com/robbyrussell/oh-my-zsh" $INSTALL_PATH/git
}

function is_installed() {
  if [ -d $INSTALL_PATH/git ]; then
    echo "true"
  else
    echo "false"
  fi
}
