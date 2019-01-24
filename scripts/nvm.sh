function is_compatable {
  if [ $SYSTEM_TYPE == 'android' ]; then
    echo "false"
  fi
}

function get_env {
  echo '
export NVM_DIR="'"$PACKAGE_DIR"'/git"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
';
}

function do_install {
  git clone https://github.com/creationix/nvm "$PACKAGE_DIR/git"
}

function is_installed {
  if [ -d $INSTALL_PATH/git ]; then
    echo "true"
  else
    echo "false"
  fi
}