export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ROOTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
export ROOTDATA=$ROOTPATH/data

source $ROOTPATH/scripts.sh

for SCRIPTNAME in $SCRIPT_PATHS
do
  function run_command {
    COMMAND=$1 \
    ROOTPATH=$ROOTPATH \
    SCRIPTNAME=$SCRIPTNAME \
      bash $ROOTPATH/lib/installer.sh $ROOTPATH $SCRIPT_PATH
  }
  
  IS_COMPATABLE=$(run_command is_compatable)

  if [ "is $IS_COMPATABLE" != "is false" ]; then
    IS_INSTALLED=$(run_command is_installed  | xargs)
    if [ $IS_INSTALLED != "true" ]; then
      rm -rf $ROOTDATA/$SCRIPTNAME
      echo "Installing $SCRIPTNAME"
      run_command do_install
    fi
    eval "$(run_command get_env)"
  fi
done