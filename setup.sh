#!/bin/bash

function install_npm_g() {
  local package=$1
  npm ls -g $package | grep $package || npm i -g $package
}

function install_gem() {
  local gem=$1
  gem list $gem | grep $gem || gem install $gem
}
echo
echo "Checking for existing componenents and installing on demand..."
echo "=============================================================="
echo
which meteor || curl https://install.meteor.com | /bin/sh
which mrt || npm install -g meteorite

echo
echo DONE
echo