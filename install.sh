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
brew tap teamookla/speedtest # speedtest-cli

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
brew install htop # System resource monitoring
brew install act # Run github actions locally
brew install tmux # Terminal multiplexer
brew install speedtest # Internet speed testing CLI
brew install topgrade # System wide updates
brew install ssh-copy-id # Transfer SSH Public key to remote
brew install fd # alternative to find command
brew install fzf # Command-line fuzzy finder
brew install httpie # API requests from CLI
brew install openssl@3 # SSL/TLS Toolkit
brew install git # Distributed revision control system
brew install cmake # cross-platform make command
brew install lz4 # Extremely Fast Compression algorithm
brew install qemu # Emulator for x86 and PowerPC
brew install unzip # Extraction utility
brew install telnet # Interface for telnet protocol
brew install docker-completion # Shell completion for docker
brew install zsh # Unix shell
brew install python@3.11 # Python v3.11.6
