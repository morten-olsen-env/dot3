#/!bin/sh

function unlock() {
  export BW_SESSION=`bw unlock --raw`
}