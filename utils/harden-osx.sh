#!/bin/zsh

function noAccess() {
  echo "The current user does not have sudo access, is the system already hardened?"
  exit 1
}

# Check to ensure that the user can sudo
sudo echo "Running" || noAccess

function createUser() {
  echo "Creating admin user"
  # Create the user
  sudo dscl . -create /Users/bob
  # Set the users shell
  sudo dscl . -create /Users/bob UserShell /bin/bash
  # Set the users real name
  sudo dscl . -create /Users/bob RealName "Bob" 
  # Set the users unique ID. No other users can have the same
  sudo dscl . -create /Users/bob UniqueID "515"
  # Set the group ID of the user
  sudo dscl . -create /Users/bob PrimaryGroupID 1000
  # Set the home directory of the user
  sudo dscl . -create /Users/bob NFSHomeDirectory /Users/bob
  # Add the user to the admin group
  sudo dscl . -append /Groups/admin GroupMembership bob
  echo "Enter password for admin account: "
  # Set password for the new user
  sudo dscl . -passwd /Users/bob
}

function setupHostfile() {
  curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | sudo tee -a /etc/hosts
}

function disableNetworkLoginPortal() {
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false
}

function setupUmask() {
  sudo launchctl config user umask 077
}

function deleteUser() {
  echo "Deleting admin user"
  # Delete the user
  sudo dscl . -delete Users/bob
  # Delete the users home directory if it exists
  sudo rm -rf /Users/bob
}

function downgrade() {
  echo "Downgrading $USER"
  # Get the current users GUID
  GUID=`dscl . -read /Users/$USER GeneratedUID | awk '{print $2}'`
  # remove user from admin group
  sudo dscl . -delete /Groups/admin GroupMembership $USER
  sudo dscl . -delete /Groups/admin GroupMembers $GUID
}

function enableFirmwarePassword() {
  # TODO: Figure out how to only set if not already set
  #sudo firmwarepasswd -setpasswd -setmode command
}

function setupFirewall() {
  echo "Setting up firewall"
  # Enable firewall
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
  # Enable firewall logging
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
  # Enable stealth mode (prevent pinging)
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
  # Require firewall on Apples built in apps
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
  # Require firewall on Apple signed apps
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off
}

function setupScreensaver() {
  echo "Setting up screen saver"
  # Enable password on screen saver
  defaults write com.apple.screensaver askForPassword -int 1
  sudo defaults write com.apple.screensaver askForPassword -int 1
  # Require password as soon as it enters screen saver/locked
  defaults write com.apple.screensaver askForPasswordDelay -int 0
  sudo defaults write com.apple.screensaver askForPasswordDelay -int 0
}

function showHiddenFiles() {
  echo "Enabling hidden files and extensions"
  # Show hidden files in finder
  defaults write com.apple.finder AppleShowAllFiles -bool true
  sudo defaults write com.apple.finder AppleShowAllFiles -bool true
  # Show Library in finder
  chflags nohidden ~/Library
  # Show extensions on all files
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true
}

function disableAppleServices() {
  echo "Disabling Apple services"
  # Don't automatically save new documents to iCloud
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
  sudo defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
  # Don't show crash report dialog
  defaults write com.apple.CrashReporter DialogType none
  sudo defaults write com.apple.CrashReporter DialogType none
  # Disable bonjore zeroconfig
  sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES
}

function run() {
  setupScreensaver
  disableAppleServices
  enableFirmwarePassword
  disableNetworkLoginPortal
  setupUmask
  setupFirewall
  setupHostfile
  showHiddenFiles
  id -u bob && deleteUser
  id -u bob || createUser && downgrade
}

run

