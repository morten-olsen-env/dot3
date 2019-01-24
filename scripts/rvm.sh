function is_compatable {
  if [ $SYSTEM_TYPE == 'android' ]; then
    echo "false"
  fi
}

function get_env {
  echo '
export rvm_path="'"$PACKAGE_DIR"'/download"
source "$rvm_path/scripts/rvm"
';
}

function do_install {
  rvm_path="$PACKAGE_DIR/download"
  curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
}

function is_installed {
  if [ -d $INSTALL_PATH/download ]; then
    echo "true"
  else
    echo "false"
  fi
}