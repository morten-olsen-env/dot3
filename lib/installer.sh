SCRIPTPATH=$ROOTPATH/scripts/$SCRIPTNAME

export INSTALL_PATH=$ROOTDATA/$SCRIPTNAME
export PACKAGE_DIR=$INSTALL_PATH
mkdir -p $INSTALL_PATH

if [ "$OSTYPE" == "linux-gnu" ]; then
  export SYSTEM_TYPE="linux"
elif [ "$OSTYPE" == "darwin"* ]; then
  export SYSTEM_TYPE="osx"
elif [ "$OSTYPE" == "linux-android" ]; then
  export SYSTEM_TYPE="android"
else
  export SYSTEM_TYPE="unknown"
fi

function setupZip() {
  INITPATH="$PWD"
  mkdir -p $PACKAGE_DIR/download
  curl "$1" -L -o "$PACKAGE_DIR/archive.tar.gz"
  echo "Downloaded"
  cd $PACKAGE_DIR/download
  tar -xf "$PACKAGE_DIR/archive.tar.gz" -C "$PACKAGE_DIR/download"
  rm "$PACKAGE_DIR/archive.tar.gz"
  cd $INITPATH
}

function add_config() {
  ln -s "$ROOTPATH/configs/$1" "$INSTALL_PATH/$2"
}

source $SCRIPTPATH
if [ -n "$(type -t $COMMAND)" ]; then
  $COMMAND
fi