#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts # nerd fonts
brew tap FelixKratz/formulae # JankyBorders & Sketchybar
brew tap koekeishiya/formulae # yabai and skhd

# Brew Formulae
brew install llvm # compiler infrastructure
brew install ccls # c/c++ language server
brew install libomp # runtime library for llvm
brew install mas # mac app store cli
brew install neovim # the OG ;)
brew install tree # list directories in tree format
brew install wget # download from the interwebz
brew install jq # json processor
brew install gh # Github CLI
brew install ripgrep # Search tool like grep
brew install rename # Perl-powered rename script
brew install neofetech # System info script
brew install ifstat # Network interface bandwidth
brew install starship # Cross shell prompt
brew install dooit # TUI todo manager
brew install alfred # Application launcher
brew install zsh-autosuggestions # fast/unobtrusive autosuggestions for zsh
brew install zsh-syntax-highlighting # syntax highlighting for zsh
brew install skhd # hotkey daemon for keybindings
brew install yabai # Tilling window manager
brew install nnn # Terminal file manager
brew install sketchybar # status bar replacement
brew install sf-symbols # highly configurable symbols for apps
brew install lazygit # Terminal UI for git commands
brew install btop # System resource monitoring

