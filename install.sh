#!/bin/bash

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Installing Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Installing cargo Packages
cargo install oxker

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts  # nerd fonts
brew tap FelixKratz/formulae  # JankyBorders & Sketchybar
brew tap koekeishiya/formulae # yabai and skhd
brew tap noahgorstein/tap

# Brew Formulae
brew install llvm              # compiler infrastructure
brew install ccls              # c/c++ language server
brew install libomp            # runtime library for llvm
brew install mas               # mac app store cli
brew install tree              # list directories in tree format
brew install wget              # download from the interwebz
brew install jq                # json processor
brew install gh                # Github CLI
brew install rename            # Perl-powered rename script
brew install neofetch          # System info script
brew install ifstat            # Network interface bandwidth
brew install starship          # Cross shell prompt
brew install skhd              # hotkey daemon for keybindings
brew install yabai             # Tilling window manager
brew install sketchybar        # status bar replacement
brew install sf-symbols        # highly configurable symbols for apps
brew install switchaudio-osx   # Audio switching CLI
brew install btop              # System resource monitoring
brew install htop              # System resource monitoring
brew install act               # Run github actions locally
brew install speedtest         # Internet speed testing CLI
brew install topgrade          # System wide updates
brew install ssh-copy-id       # Transfer SSH Public key to remote
brew install httpie            # API requests from CLI
brew install openssl@3         # SSL/TLS Toolkit
brew install git               # Distributed revision control system
brew install cmake             # cross-platform make command
brew install lz4               # Extremely Fast Compression algorithm
brew install qemu              # Emulator for x86 and PowerPC
brew install unzip             # Extraction utility
brew install telnet            # Interface for telnet protocol
brew install docker-completion # Shell completion for docker
brew install python@3.11       # Python v3.11.5
brew install ncdu              # File storage analyzer
brew install git-delta         # Syntax highligting pager for git diff
brew install jqp               # A TUI playground to experiment with jq
brew install tealdeer          # Cheatsheets for CLI commands
brew install jq                # YAML, JSON, XML, CSV, TOML processor
brew install tmuxp             # tmux session manager
brew install btop              # system resource monitoring
brew install gping             # ping command but with a graph
brew install broot             # Ultra pro Navigation
brew install eza               # replacement for ls
brew install procs             # modern replacement for ps
brew install zoxide            # modern replacment for cd
brew install navi              # cheat sheet module for the CLI
brew install onefetch          # Information on current git repo
brew install howdoi            # technical suggestions within your CLI
brew install weechat           # Extensible IRC Client
brew install glow              # markdown previews
brew install fx                # Terminal JSON viewer & processor
brew install tokei             # count your code
brew install trippy            # Network diagnostics tool

# Terminal Setup
brew install tmux                    # Terminal multiplexer
brew install fd                      # alternative to find command
brew install fzf                     # Command-line fuzzy finder
brew install ripgrep                 # grep like features
brew install zsh                     # Unix shell
brew install zsh-vi-mode             # vim mode plugin for zsh
brew install zsh-autosuggestions     # unobstrusive suggestions for zsh
brew install zsh-syntax-highlighting # syntax-highlighting for zsh
brew install lazygit                 # Terminal UI for git
brew install nnn                     # Terminal file manager
brew install neovim                  # the OG ;)

## Casks
echo "Installing Brew Casks..."
### Terminals & Browsers
brew install --cask alacritty
brew install --cask kitty
brew install --cask orion

### Nice to have
brew install --cask alfred
brew install --cask spotify

### Fonts
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 497799835  #xCode
mas install 1480933944 #Vimari
mac install 1284863847 # Unsplash Wallpapers
mac install 937984704  # Amphetamine

# Python Packages
echo "Installing Python Packages..."
pip install dooit
pip install debugpy
pip install pynvim
pip install pyyaml
pip install arsenal-cli

# macOS Settings
echo "Changing macOS defaults..."

# Allows the Finder to browse all available network interfaces.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Prevents the creation of .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disables the option to have Spaces span multiple displays.
defaults write com.apple.spaces spans-displays -bool false

# Enables auto-hiding of the Dock.
defaults write com.apple.dock autohide -bool true

# Disables the most recently used Spaces feature in the Dock.
defaults write com.apple.dock "mru-spaces" -bool "false"

# Reverses the scroll direction.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Sets the keyboard key repeat rate to the fastest.
defaults write NSGlobalDomain KeyRepeat -int 1

# Shows file extensions in Finder.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Hides the menu bar.
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Sets the highlight color.
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"

# Sets the accent color.
defaults write NSGlobalDomain AppleAccentColor -int 1

# Hides external hard drives on the desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# Hides internal hard drives on the desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Hides mounted servers on the desktop.
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Hides removable media on the desktop.
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Shows hidden files in Finder.
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Sets the default search scope to the current folder.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disables the warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Shows the POSIX path in Finder window titles.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Sets the default Finder view style to list view.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Hides the status bar in Finder.
defaults write com.apple.finder ShowStatusBar -bool false

# Enables developer extras globally.
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Excludes the sender's name when copying email addresses in Mail.
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Fonts setup

# Installing sketchybar-app-font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Installing SFMono-Nerd-Font for neovim
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

# Create backup of .config folder

# Set the source and destination paths
source_folder="$HOME/.config"
destination_folder="$HOME/backup"

# Create the destination folder if it doesn't exist
mkdir -p "$destination_folder"

# Get the current date for the backup filename
backup_date=$(date +"%Y%m%d_%H%M%S")

# Create the zip file with a timestamp
zip_filename="config_backup_$backup_date.zip"
zip_filepath="$destination_folder/$zip_filename"

# Zip the .config folder
zip -r "$zip_filepath" "$source_folder"

# Check if the zip operation was successful
if [ $? -eq 0 ]; then
	echo "Backup successful. Zip file created at: $zip_filepath"
	# Replace .config folder in $HOME with ones from the online repo

	# Set the source repository URL
	git_repo_url="git@github.com:anil-dewani/dotfiles.git"

	# Set the target directory for git clone
	clone_dir="/tmp/cloned_repo_dotfiles"

	# Set the home directory
	home_dir="$HOME"

	# Set the folders to copy
	folders_to_copy=("alacritty", "broot", "btop", "nvim", "sketchybar", "skhd", "tmux", "tmuxp", "yabai")

	# Set the destination folder in the user's .config directory
	destination_folder="$HOME/.config"

	# Perform git clone
	git clone "$git_repo_url" "$clone_dir"

	# Check if git clone was successful
	if [ $? -ne 0 ]; then
		echo "Git clone failed. Exiting."
		exit 1
	fi

	# Create the destination folder if it doesn't exist
	mkdir -p "$destination_folder"

	# Copy specified folders to the .config folder
	for folder in "${folders_to_copy[@]}"; do
		cp -r "$clone_dir/$folder" "$destination_folder"
	done

	# Copy dooit config into respective folder
	dooit_config_location = $(python -c "import appdirs; print(appdirs.user_config_dir('dooit'))")
	cp -r "$clone_dir/dooit" "$dooit_config_location"

	# set the Wallpaper
	# Specify the path to the wallpaper image
	wallpaper_path="$clone_dir/wallpapers/midnightmountains.png"

	# Set the wallpaper for all desktops
	osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$wallpaper_path\""

	# Specify the paths to the new .gitconfig and .zshrc files
	new_gitconfig_path="/path/to/your/new/.gitconfig"
	new_zshrc_path="/path/to/your/new/.zshrc"

	# Backup existing .gitconfig
	if [ -e "$home_dir/.gitconfig" ]; then
		mv "$home_dir/.gitconfig" "$home_dir/.gitconfig_backup_$(date +'%Y%m%d_%H%M%S')"
		echo "Backup of .gitconfig created."
	fi

	# Backup existing .zshrc
	if [ -e "$home_dir/.zshrc" ]; then
		mv "$home_dir/.zshrc" "$home_dir/.zshrc_backup_$(date +'%Y%m%d_%H%M%S')"
		echo "Backup of .zshrc created."
	fi

	# Copy the new .gitconfig and .zshrc files
	cp "$clone_dir/.gitconfig" "$home_dir/.gitconfig"
	cp "$clone_dir/.zshrc" "$home_dir/.zshrc"

	echo "Replacement of .gitconfig and .zshrc completed."

	# Clean up: remove the temporary clone directory
	rm -rf "$clone_dir"

	echo "Git clone and copy completed successfully."
else
	echo "Backup failed. Please check for errors."
fi

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start yabai

# Authorise github CLI
gh auth login

csrutil status
echo "Do not forget to disable SIP"
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"

echo "Installation setup completed. Highly adviced to restart your system once."
sudo shutdown -r
