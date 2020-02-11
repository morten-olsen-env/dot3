#/!bin/sh

function unlock() {
  if [ -z "$BW_SESSION" ]; then
    export BW_SESSION=`bw unlock --raw`
  fi
}

function getpass() {
  unlock
  PASS=`bw get password $1`
  echo "$PASS"
}

function getpassitem() {
  unlock
  ID=$1
  PASS=`bw get item "$ID" | fx "i => i.login.password"`
  echo "$PASS"
}
