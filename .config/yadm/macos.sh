#!/usr/bin/env bash

# Make System Tweaks
printHeading "System Tweaks"
  printDivider
    echo "✔ General: Expand save and print panel by default"
      defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
      defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
      defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
      defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
    echo "✔ General: Save to disk (not to iCloud) by default"
      defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
    echo "✔ General: Avoid creating .DS_Store files on network volumes"
      defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    echo "✔ Typing: Disable smart quotes and dashes as they cause problems when typing code"
      defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
      defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

    echo "✔ Finder: Show status bar, path bar, and sidebar"
      defaults write com.apple.finder ShowStatusBar -bool true
      defaults write com.apple.finder ShowPathbar -bool true
      defaults write com.apple.finder ShowSidebar -bool true
    echo "✔ Finder: Showing state of items in sidebar"
      defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
      defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
      defaults write com.apple.finder SidebarShowingSignedIntoiCloud -bool true
      defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false
      defaults write com.apple.finder SidebarTagsSctionDisclosedState -bool true

    echo "✔ Finder: Disable the warning when changing a file extension"
      defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    echo "✔ Finder: Show the ~/Library folder"
      chflags nohidden ~/Library
    echo "✔ Finder: Do not show icons for hard drives or removable media on the desktop"
      defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
      defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
    echo "✔ Finder: Showing mounted servers on the desktop"
      defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
    echo "✔ Finder: Hide recent tags"
      defaults write com.apple.finder ShowRecentTags -bool false

    echo "✔ Showing all filename extensions in Finder by default"
      defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    echo "✔ Finder: Disabling the warning when changing a file extension"
      defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    echo "✔ Finder: Disable iCloud stuff"
      defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
      defaults write com.apple.finder FXICloudDriveDeclinedUpgrade -bool false
      defaults write com.apple.finder FXICloudDriveDesktop -bool false
      defaults write com.apple.finder FXICloudDriveDocuments -bool false
      defaults write com.apple.finder FXICloudDriveEnabled -bool false
      defaults write com.apple.finder FXICloudDriveFirstSyncDownComplete -bool false
      defaults write com.apple.finder FXICloudLoggedIn -bool true

    echo "✔ Use column view in all Finder windows by default"
      defaults write com.apple.finder FXPreferredViewStyle Clmv

    echo "✔ Sort folders first"
      defaults write com.apple.finder _FXSortFoldersFirst -bool true
      defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

    echo "✔ Avoiding the creation of .DS_Store files on network volumes"
      defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    echo "✔ Enabling snap-to-grid for icons on the desktop and in other icon views"
      /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
      /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
      /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

    echo "✔ Showing Safari's bookmarks bar by default"
    defaults write com.apple.Safari ShowFavoritesBar -bool true
    echo "✔ Hiding Safari's sidebar in Top Sites"
    defaults write com.apple.Safari ShowSidebarInTopSites -bool false
    echo "✔ Disabling Safari's thumbnail cache for History and Top Sites"
    defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
    echo "✔ Enabling Safari's debug menu"
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
    echo "✔ Making Safari's search banners default to Contains instead of Starts With"
    defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

    echo "✔ Removing useless icons from Safari's bookmarks bar"
    defaults write com.apple.Safari ProxiesInBookmarksBar "()"

    echo "✔ Enabling the Develop menu and the Web Inspector in Safari"
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

    echo "✔ Adding a context menu item for showing the Web Inspector in web views"
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

    echo "✔ Chrome: Use the system print dialog and expand dialog by default"
      defaults write com.google.Chrome DisablePrintPreview -bool true
      defaults write com.google.Chrome.canary DisablePrintPreview -bool true
      defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
      defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

    echo "✔ Disabling system-wide resume"
    defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

    # echo "✔ Disabling automatic termination of inactive apps"
    # defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

    echo "✔ Allow text selection in Quick Look"
    defaults write com.apple.finder QLEnableTextSelection -bool TRUE

    echo "✔ Disabling OS X Gate Keeper"
    echo "  (You'll be able to install any app you want from here on, not just Mac App Store apps)"
    sudo spctl --master-disable
    sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
    defaults write com.apple.LaunchServices LSQuarantine -bool false


    echo "✔ Automatically quit printer app once the print jobs complete"
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

    echo "✔ Saving to disk (not to iCloud) by default"
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

    # echo "✔ Check for software updates daily, not just once per week"
    # defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

    # echo "✔ Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
    # defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

    # echo "✔ Disabling press-and-hold for keys in favor of a key repeat"
    # defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

    # echo "✔ Setting trackpad & mouse speed to a reasonable number"
    # defaults write -g com.apple.trackpad.scaling 2
    # defaults write -g com.apple.mouse.scaling 2.5

    # echo "✔ Enabling subpixel font rendering on non-Apple LCDs"
    # defaults write NSGlobalDomain AppleFontSmoothing -int 2

    # echo "✔ Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
    # defaults write com.apple.dock tilesize -int 36

    echo "✔ Grouping windows by application in expose"
    # defaults write com.apple.dock expose-animation-duration -float 0.1
    defaults write com.apple.dock "expose-group-by-app" -bool true

    echo "✔ Setting Dock to auto-hide" # and removing the auto-hiding delay"
    defaults write com.apple.dock autohide -bool true
    # defaults write com.apple.dock autohide-delay -float 0
    # defaults write com.apple.dock autohide-time-modifier -float 0

    echo "✔ Preventing Time Machine from prompting to use new hard drives as backup volume"
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    # echo "✔ Speeding up wake from sleep to 24 hours from an hour"
    # # http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
    # sudo pmset -a standbydelay 86400

    echo "✔ Setting screenshots location to ~/Desktop"
    defaults write com.apple.screencapture location -string "$HOME/Desktop"

    echo "✔ Setting screenshot format to PNG"
    defaults write com.apple.screencapture type -string "png"

    echo "✔ Disable 'natural' (Lion-style) scrolling"
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

    echo "✔ Don’t automatically rearrange Spaces based on most recent use"
    defaults write com.apple.dock mru-spaces -bool false

  printDivider

killall Finder
