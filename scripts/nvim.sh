function get_env {
  echo '
export VIM_BASE_PATH="'"$PACKAGE_DIR"'"
export VIM_PLUGIN_PATH="$VIM_BASE_PATH/plugged"
export VIM_EXECUTABLE="nvim"
alias vim="$VIM_EXECUTABLE -u $VIM_BASE_PATH/init.vim -N"
export EDITOR="$VIM_EXECUTABLE -u $VIM_BASE_PATH/init.vim -N"
  '
}

function do_install {
  add_config init.vim init.vim 
  curl -fLo $PACKAGE_DIR/autoload/plug.vim --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
}

function is_installed {
  if [ -d $INSTALL_PATH/autoload ]; then
    echo "true"
  else
    echo "false"
  fi
}
