#!/bin/zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
if [ -z $ROOTPATH ]; then
  ROOTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
fi
export ROOTDATA=$ROOTPATH/data

if [ ! -f $ROOTPATH/scripts.sh ]; then
  cp $ROOTPATH/default-scripts.sh $ROOTPATH/scripts.sh
fi
source $ROOTPATH/aliases.sh
source $ROOTPATH/scripts.sh
source $ROOTPATH/functions.sh

export PATH=$ROOTPATH/bin:$PATH
export PATH=$HOME/.bin:$PATH

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

export FZF_DEFAULT_COMMAND='ag -g ""'
bindkey -v
export KEYTIMEOUT=1
