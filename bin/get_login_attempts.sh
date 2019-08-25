#!/bin/bash
sudo journalctl -xe | grep "Invalid user" | awk '{print $1 " " $2 ", "  $3 " - " $8}'
