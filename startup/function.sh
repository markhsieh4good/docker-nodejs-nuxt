#!/bin/bash

_EXEC_FOLDER="/opt/app"

function prepare() {
  echo "install/building ... "
  cd ${_EXEC_FOLDER}

  ## install modules
  /usr/local/bin/npm install --global cross-env
  /usr/local/bin/npm install
  /usr/local/bin/npm audit fix

  ## building ...
  /usr/local/bin/npm run build
  ls -la
}

function start() {
  echo "start ..."
  cd ${_EXEC_FOLDER}
  /usr/local/bin/npm run start
}

function main() {
  prepare
  start
}
main
