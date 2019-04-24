ROOTPATH="$(dirname $(readlink ~/.zshrc))"
source $ROOTPATH/.zshrc

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi


# added by travis gem
[ -f /Users/steve/.travis/travis.sh ] && source /Users/steve/.travis/travis.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/steve/projects/sampension/lambda/discovery/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/steve/projects/sampension/lambda/discovery/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/steve/projects/sampension/lambda/discovery/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/steve/projects/sampension/lambda/discovery/node_modules/tabtab/.completions/sls.zsh