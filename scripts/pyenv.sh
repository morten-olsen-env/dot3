function is_compatable {
  if [ $SYSTEM_TYPE == 'android' ]; then
    echo "false"
  fi
}

function get_env {
  echo '
export PYENV_ROOT="'"$PACKAGE_DIR"'/git"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
';
}

function do_install {
  git clone https://github.com/pyenv/pyenv $PACKAGE_DIR/git
}

function is_installed {
  if [ -f $INSTALL_PATH/git/bin/pyenv ]; then
    echo "true"
  else
    echo "false"
  fi
}