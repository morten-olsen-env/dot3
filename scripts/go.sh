function is_compatable {
  if [ $SYSTEM_TYPE == 'android' ]; then
    echo "false"
  fi
}

function get_env {
  echo '
export GOROOT="'"$PACKAGE_DIR"'/download/go"
export PATH=$GOROOT/bin:$PATH
';
}

function do_install {
  setupZip https://dl.google.com/go/go1.10.darwin-amd64.tar.gz
}

function is_installed {
  if [ -d $INSTALL_PATH/download/go ]; then
    echo "true"
  else
    echo "false"
  fi
}