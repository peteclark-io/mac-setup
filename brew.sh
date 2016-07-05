#!/bin/bash

cd $(dirname $0)

function install_dockutil {
  if [[ -d ~/Code/dockutil ]]; then
    return
  fi

  cd ~/code
  git clone git@github.com:kcrawford/dockutil.git
  cd -
}

function install_go {
  brew cask install go
  cd /usr/local/bin
  ln -s /usr/local/go/bin/go
  ln -s /usr/local/go/bin/godoc
  ln -s /usr/local/go/bin/gofmt
  cd -
}

brew install ngrep
brew cask install atom

brew cask install java
brew cask install ngrok
brew install nodejs
brew install mutt
brew install jq

install_dockutil
install_go

brew cask install boxer
brew cask install dropbox

brew install ledger
