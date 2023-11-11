#!/bin/bash 
# Check if xcode-select is installed
# include individual scripts
source install_apps.inc
source mac_os_x_settings.inc 
source setup_dot_files.inc

install_apps

# Apply Mac OSX settings 
apply_os_settings

## Setup DotFiles 
install_dotfiles
