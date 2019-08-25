function is_compatable {
  if [ $SYSTEM_TYPE == 'android' ]; then
    echo "false"
  fi
}

function get_env {
  echo '
export VSCODE_PATH="'"$PACKAGE_DIR"'/download/Visual Studio Code.app"
export PATH='"$PACKAGE_DIR"'/bin:$PATH
export EDITOR="code --wait"
  '
}

function do_install {
  mkdir -p "$PACKAGE_DIR/download/code-portable-data"
  INITPATH="$PWD"
  mkdir -p "$PACKAGE_DIR/download/code-portable-data"
  echo "OS: $SYSTEM_TYPE"
  if [ $SYSTEM_TYPE == 'osx' ]; then
    echo "Installing as OSX"
    curl https://go.microsoft.com/fwlink/?LinkId=723966 -L -o "$PACKAGE_DIR/download/vscode.zip"
    unzip "$PACKAGE_DIR/download/vscode.zip" -d "$PACKAGE_DIR/download/"
    rm "$PACKAGE_DIR/download/vscode.zip"
    mv "$PACKAGE_DIR/download/Visual Studio Code - Insiders.app" "$PACKAGE_DIR/download/Visual Studio Code.app"
    xattr -dr com.apple.quarantine "$PACKAGE_DIR/download/Visual Studio Code.app"
  elif [ $SYSTEM_TYPE == 'linux' ]; then
    curl https://go.microsoft.com/fwlink/?LinkID=620884 -L -o "$PACKAGE_DIR/download/vscode.tar.gz"
    tar -xvf "$PACKAGE_DIR/download/vscode.tar.gz"
    rm "$PACKAGE_DIR/download/vscode.tar.gz"
  fi
  cd $PACKAGE_DIR/download
  cd $INITPATH
  mkdir -p "$PACKAGE_DIR/bin"
  echo '
  #!/usr/bin/env bash
CONTENTS=$VSCODE_PATH/Contents
ELECTRON="$CONTENTS/MacOS/Electron"
CLI="$CONTENTS/Resources/app/out/cli.js"
ELECTRON_RUN_AS_NODE=1 "$ELECTRON" "$CLI" "$@"
exit $?
' > "$PACKAGE_DIR/bin/code"
  chmod +x "$PACKAGE_DIR/bin/code"
}

function is_installed {
  if [ -f $INSTALL_PATH/bin/code ]; then
    echo "true"
  else
    echo "false"
  fi
}
