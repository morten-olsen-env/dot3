echo "type $OSTYPE"
if [ "$OSTYPE" == "linux-gnu" ]; then
  export SYSTEM_TYPE="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export SYSTEM_TYPE="osx"
elif [ "$OSTYPE" == "linux-android" ]; then
  export SYSTEM_TYPE="android"
else
  export SYSTEM_TYPE="unknown"
fi

echo "OS $SYSTEM_TYPE" 
