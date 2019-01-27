function get_env {
  echo '
alias tmux="tmux -f \"'"$PACKAGE_DIR"'/tmux.conf\""
  '
}

function do_install {
  add_config tmux.conf tmux.conf
}

function is_installed {
  if [ -f $INSTALL_PATH/tmux.conf ]; then
    echo "true"
  else
    echo "false"
  fi
}
