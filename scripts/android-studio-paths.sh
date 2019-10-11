function is_compatable {
  echo "true"
}

function get_env {
  echo "
export ANDROID_HOME=\"$HOME/Library/Android/sdk\"
export PATH=\$ANDROID_HOME/tools/bin:\$PATH
export PATH=\$ANDROID_HOME/platform-tools:\$PATH
export PATH=\"/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin:\$PATH\"
  "
}

function do_install {
  echo "setup"
}

function is_installed {
  echo "true"
}
