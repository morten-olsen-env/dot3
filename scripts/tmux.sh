function get_env {
  echo '
alias tmux="tmux -f \"'"$PACKAGE_DIR"'/tmux.conf\""
export TMUX_PLUGIN_PATH="'"$PACKAGE_DIR/plugins"'"
export TMUX_THEME_PATH="'"$PACKAGE_DIR/themes"'"
  '
}

function do_install {
  add_config tmux.conf tmux.conf
  git clone https://github.com/jimeh/tmux-themepack.git "$PACKAGE_DIR/themes"
  # git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function is_installed {
  if [ -f $INSTALL_PATH/tmux.conf ]; then
    echo "true"
  else
    echo "false"
  fi
}
