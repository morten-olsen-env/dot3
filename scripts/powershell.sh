function get_env {
  echo '
export PATH='"$PACKAGE_DIR"'/download:$PATH
';
}

function do_install {
  url="https://github.com/PowerShell/PowerShell/releases/download/v6.0.3/powershell-6.0.3-osx-x64.tar.gz"
  if [ $SYSTEM_TYPE == 'android' ]; then
    url="https://github.com/PowerShell/PowerShell/releases/download/v6.1.2/powershell-6.1.2-linux-arm32.tar.gz"
  fi
  setupZip $url
}

function is_installed {
  if [ -f $INSTALL_PATH/download/pwsh ]; then
    echo "true"
  else
    echo "false"
  fi
}