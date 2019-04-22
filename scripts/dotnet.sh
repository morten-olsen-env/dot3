function get_env {
  echo '
export PATH="'$PACKAGE_DIR'/download:$PATH"
';
}

function do_install {
  url="https://download.visualstudio.microsoft.com/download/pr/7315b6a5-b535-4349-892a-7ec82b573724/f44f5f852f0ef4364cff9d00035a3987/dotnet-sdk-2.2.103-osx-x64.tar.gz"
  if [ $SYSTEM_TYPE == 'android' ]; then
    url="https://download.visualstudio.microsoft.com/download/pr/d9e60c5f-af85-4a9e-99ab-26d0cbbd70b7/5fde0e1f8ce2217494e325c9bc09fc0e/dotnet-sdk-2.2.103-linux-arm64.tar.gz"
  elif [ $SYSTEM_TYPE == 'linux' ]; then
    url="https://dotnetcli.blob.core.windows.net/dotnet/Sdk/master/dotnet-sdk-latest-linux-x64.tar.gz"
  fi
  setupZip $url
}

function is_installed {
  if [ -f $INSTALL_PATH/download/dotnet ]; then
    echo "true"
  else
    echo "false"
  fi
}
