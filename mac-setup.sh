#!/bin/bash

# Some references:
# https://github.com/kennethreitz/osx-gcc-installer
# https://github.com/josh/osx-cookbooks
# https://github.com/atmos/cinderella
# https://github.com/atmos/smeagol

if ! [ -e `which gcc` ]; then
  echo "gcc must be installed"
  echo "Install Xcode or gcc to use"
  exit 126
fi

## Mac OS settings
# http://www.mactricksandtips.com/2008/02/top-50-terminal-commands.html
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# # Show remaining battery %age; 
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable window animations
#defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show item info below desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable tap to click (Trackpad)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Map bottom right Trackpad corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeDebugMenu -bool true

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Disable the Ping sidebar in iTunes
defaults write com.apple.iTunes disablePingSidebar -bool true

# Disable all the other Ping stuff in iTunes
defaults write com.apple.iTunes disablePing -bool true

# Disable send and reply animations in Mail.app
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true

# Reset Launchpad
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

# Show the ~/Library folder
chflags nohidden ~/Library

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# Fix for the ancient UTF-8 bug in QuickLook (http://mths.be/bbo)
# Commented out, as this is known to cause problems when saving files in Adobe Illustrator CS5 :(
#echo "0x08000100:0" > ~/.CFUserTextEncoding

# Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder DesktopViewOptions -dict IconSize -integer 72
defaults write com.apple.finder AppleShowAllFiles true
# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Safari
defaults write com.apple.Safari IncludeDebugMenu 1
defaults write com.apple.Safari WebKitDeveloperExtras -bool true

# Set screenshot directory
defaults write com.apple.screencapture location ~/Pictures/Screenshots
# iTunes
#defaults write com.apple.iTunes allow-half-stars -bool true
#defaults write com.apple.iTunes invertStoreLinks -bool true

# Dock
defaults write com.apple.Dock autohide -bool true
defaults write com.apple.dock largesize -int 65
defaults write com.apple.dock tilesize -int 45


# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilte-stack -bool true
# Enable spring loading for all Dock items
defaults write enable-spring-load-actions-on-all-items -bool true
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
# # Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

# remove autohide delay. 
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# translucent hidden app icons 
defaults write com.apple.Dock showhidden -bool YES && killall Dock

# Enable Text Selection in Quick Look Windows
defaults write com.apple.finder QLEnableTextSelection -bool TRUE;killall Finder

#Disable disk image verification 
defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true


#Default finder to home 
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

#disable motion sensor on ssd macs 
#sudo pmset -a sms 0


# Spotlight
# echo $sudo_pass | sudo chmod 0 /System/Library/CoreServices/Spotlight.app

# Mouse
#defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode "TwoButton"

# Printing
#defaults write -g PMPrintingExpandedStateForPrint -bool true

# Kill affected applications
for app in Safari Finder Dock Mail; do killall "$app"; done

# Do not hide ~/Library in Lion
chflags nohidden $HOME/Library

# Install X-code cmdline tools 
sudo xcode-select --install

if ! [ -e `which brew` ]; then 
    echo "installing brew"
    # Install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew install curl
brew install git
brew install growlnotify
brew install markdown
brew install node
brew install python3
brew install rsync
brew install wget

# Install basic apps 
brew cask install google-chrome
brew cask install visual-studio-code 
brew cask install docker
brew cask install skype
brew cask install spotify
brew cask install telegram
brew cask install iterm2
brew cask install spectacle
brew cask install firefox
brew cask install postman
brew cask install vlc
brew cask install mattermost
brew cask install adobe-acrobat-reader
brew cask install keepassx
brew cask install alfred

#add visual studio code to path 
echo "Adding VSCode to path.."
cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# setup workspace if not there
mkdir -p $HOME/dev/daimler/go 
ln -s  $HOME/dev/daimler $HOME/work 
#install golang
brew install go --cross-compile-common 
echo >> "export GOPATH=$HOME/dev/daimler/go " $HOME/.bash_rc

npm install -g eslint

# install visual studio code extensions 
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension PeterJausovec.vscode-docker
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.python
code --install-extension lukehoban.Go
code --install-extension eamodio.gitlens 

# Link all applications
mkdir $HOME/Applications
brew linkapps




# Set login screen text 
# defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Daimler Mobility Services GmbH"

# setup some aliases 
cat << EOF >> ~/.bash_profile
alias ll="ls -la"
alias genkey="ssh-keygen -t rsa -b 4096"
alias copyid="ssh-copy-id"
alias ll='ls -l -sort'
alias ..='cd ..'
alias ...='cd ../../'
alias b='cd -'
alias ~='cd ~'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias c='pbcopy'
alias v='pbpaste'

EOF

#
echo "Done .... Rebooting"
echo "Press Ctrl + C to cancel"
sleep 15

sudo reboot