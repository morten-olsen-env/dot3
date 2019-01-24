UPDATE=191
HASH=b12/2787e4a523244c269598db4e85c51e0c

function is_compatable {
  if [ $SYSTEM_TYPE == 'android' ]; then
    echo "false"
  fi
}

function get_env {
  echo '
export JAVA_HOME="'"$PACKAGE_DIR"'/jdk/Contents/Home"
export JDK_HOME="$JAVA_HOME"
export PATH="$JAVA_HOME/bin:$PATH"
';
}

function do_install {
  JAVA_HOME="$PACKAGE_DIR/jdk/Contents/Home"
  JDK_HOME="$JAVA_HOME"
  PATH="$JAVA_HOME/bin:$PATH"
  curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u$UPDATE-$HASH/jdk-8u$UPDATE-macosx-x64.dmg -o "$PACKAGE_DIR/jdk.dmg"
  hdiutil attach "$PACKAGE_DIR/jdk.dmg"
  mkdir -p "$PACKAGE_DIR/jdk"
  pkgutil --expand "/Volumes/JDK 8 Update $UPDATE/JDK 8 Update $UPDATE.pkg" "$PACKAGE_DIR/jdktmp"
  diskutil umount "/Volumes/JDK 8 Update $UPDATE"
  pushd "$PACKAGE_DIR/jdk"
  cat "$PACKAGE_DIR/jdktmp/jdk180$UPDATE.pkg/Payload" | gunzip -dc | cpio -i
  popd
  rm -rf "$PACKAGE_DIR/jdktmp"
  rm -f "$PACKAGE_DIR/jdk.dmg"
}

function is_installed {
  if [ -d $INSTALL_PATH/jdk/Contents/Home/bin ]; then
    echo "true"
  else
    echo "false"
  fi
}