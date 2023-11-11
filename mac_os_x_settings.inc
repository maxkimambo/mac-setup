function apply_os_settings(){

    # Fix trackpad direction
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

    # Disable dictionary lookup
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0

    # Remap alt and cmd keys for ergonomics (if using windows keyboard)
    # This depends on the exact keyboard and may not always be consistent
    # The script below assumes a common configuration.
    # Default key mapping: Command(55) and Option(58)
    defaults write -g com.apple.keyboard.modifiermapping.1452-611-0 -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>58</integer><key>HIDKeyboardModifierMappingSrc</key><integer>55</integer></dict>'
    defaults write -g com.apple.keyboard.modifiermapping.1452-611-0 -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>55</integer><key>HIDKeyboardModifierMappingSrc</key><integer>58</integer></dict>'

    # Finder settings
    # Show filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # When performing a search -> Search the Current Folder
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    # Show path bar in footer for easier navigation
    defaults write com.apple.finder ShowPathbar -bool true

    # Create “Work” folder and pin it
    mkdir -p ~/dev/github.com/maxkimambo

    # MacOS Dock
    # Remove everything from the Dock except: Finder, System Preferences and Trash
    dockItems=(
        "System Settings.app"
        "Visual Studio Code.app"
        "iTerm.app"
        "Google Chrome.app"
    )

    # Remove all applications from Dock
    defaults delete com.apple.dock persistent-apps

    # Add specified applications to the Dock
    for app in "${dockItems[@]}"; do
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    done

    # Set Dark mode
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'

    # Turn Dock Auto Hiding on
    defaults write com.apple.dock autohide -bool true

    # Turn auto-hide off for MacOS Menu bar
    defaults write NSGlobalDomain _HIHideMenuBar -bool false

    # take screenshots as jpg (usually smaller size) and not png
    defaults write com.apple.screencapture type jpg

    # do not open previous previewed files (e.g. PDFs) when opening a new one
    defaults write com.apple.Preview ApplePersistenceIgnoreState YES

    # show Library folder
    chflags nohidden ~/Library

    # show hidden files
    defaults write com.apple.finder AppleShowAllFiles YES

    # show path bar
    defaults write com.apple.finder ShowPathbar -bool true

    # show status bar
    defaults write com.apple.finder ShowStatusBar -bool true

    # show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    
    # Set mouse and trackpad speed 
    defaults write -g com.apple.mouse.scaling 2.7
    defaults write -g com.apple.trackpad.scaling 2.7
    # Finally, restart affected processes
    killall Finder
    killall Dock

    echo "******************************************"
    echo "* RESTART YOUR MAC TO APPLY CHANGES      *"
    echo "******************************************"
}