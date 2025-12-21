load-nvm() {
  unset -f load-nvm nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

nvm() {
  load-nvm
  command nvm "$@"
}

node() {
  load-nvm
  command node "$@"
}

npm() {
  load-nvm
  command npm "$@"
}

npx() {
  load-nvm
  command npx "$@"
}
