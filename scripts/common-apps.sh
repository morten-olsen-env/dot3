function is_compatable {
  if [ $SYSTEM_TYPE == 'android' ]; then
    echo "false"
  fi
}

function get_env {
  echo '
export FZF_DEFAULT_COMMAND="fd --type f"
export PATH="'"$INSTALL_PATH"'/download/bin:$PATH"
export PATH="'"$INSTALL_PATH"'/download/opt/curl/bin:$PATH"
  '
}

function do_install {
  if [ $(uname) = 'Darwin' ]; then
    if ! [ -f $INSTALL_PATH/download ]; then
      mkdir -p $INSTALL_PATH/download
      curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$INSTALL_PATH/download"
    fi
    export PATH="$INSTALL_PATH/download/bin:$PATH"
    brew tap caskroom/fonts
    brew tap caskroom/versions
    brew cask install \
      docker \
      protonmail-bridge \
      tunnelblick \
      gpg-suite \
      brave-browser \
      font-firacode-nerd-font \
      vlc
    brew install \
      yarn \
      bitwarden-cli \
      watchman \
      ykman \
      neovim \
      tmux \
      fd \
      lsd \
      fzf \
      tree
  fi
}

function is_installed {
  if [ -f $INSTALL_PATH/download/bin/brew ]; then
    echo "true"
  else
    echo "false"
  fi
}
