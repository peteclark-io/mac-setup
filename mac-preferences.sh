#!/bin/bash

cd $(dirname $0)

. ./log.sh

function run_preferences {
  ssh-add -K

  # Automatically quit printer app once the print jobs complete
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Disable “natural” (Lion-style) scrolling
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

  # Show hidden files
  # defaults write com.apple.finder AppleShowAllFiles YES

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  # defaults write com.apple.finder ShowPathbar -bool true

  # When performing a search, search the current folder by default
  # defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # Enable swipe up for expose on Dock items.
  defaults write com.apple.dock scroll-to-open -bool true

  # Show hidden apps as translucent in the dock
  # defaults write com.apple.dock showhidden -bool true

  # Disable the warning before emptying the Trash
  defaults write com.apple.finder WarnOnEmptyTrash -bool false

  # Set the icon size of Dock items to 56 pixels
  defaults write com.apple.dock tilesize -int 56

  # Setup top-right hot corner to mission control
  defaults write com.apple.dock wvous-tr-corner -int 2
  defaults write com.apple.dock wvous-tr-modifier -int 0

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Kill affected apps
  killall Finder
  killall Dock
}

# If this preference isn't set, re-run everything
if [[ $(defaults read | grep "com.apple.swipescrolldirection" | wc -l) -eq 0 ]] || [[ $(defaults read NSGlobalDomain com.apple.swipescrolldirection) -eq 1 ]]; then
  run_preferences
else
  log.info "Preferences appear to be correct! Skipping them."
fi
