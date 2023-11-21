![purple_neon_abstract_4k](https://github.com/anil-dewani/dotfiles/assets/99182221/622f22e8-3632-4ba2-8fd6-662c44b57429)


<p align="center">
<a href="#install">⚙️ Installation Script</a>
<span> • </span>
<a href="#screenshots">💻 Screenshots</a> 
<span> • </span> 
<a href="https://github.com/anil-dewani/dotfiles/wiki">📚 Documentation</a>
<span> • </span> 
<a href="#filestructure">📁 File Structure</a>
</p>

<p align="center">
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
<a href="https://en.wikipedia.org/wiki/Free_and_open-source_software"><img src="https://img.shields.io/badge/FOSS-100%25-green.svg?style=flat"></a>
</p>

## ✨  Introduction

This repository serves as a central hub for all of my configuration files which i've tweaked to enhance my DX (Developer Experience). I've an install.sh script which can be used to initialise all of my new systems or existing systems to adhere to my configurations automatically.

## 🚀  Tools of the trade

- [NeoVim](https://neovim.io/) - my Personalized Development Environment (PDE) ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [Sketchybar](https://github.com/FelixKratz/SketchyBar) - customizable macOS statusbar ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for git commands
- [Zsh](https://www.zsh.org/) - Unix Shell
- [Starship](https://starship.rs/) - Modern Shell Prompt
- [skhd](https://github.com/koekeishiya/skhd) - Hotkey Daemon for macOS ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [yabai](https://github.com/koekeishiya/yabai) - Tiling Window Manager ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [tmux](https://github.com/tmux/tmux) - Terminal Multiplexer ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [tmuxp](https://github.com/tmux-python/tmuxp) - tmux Session Manager ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [Alacritty](https://github.com/alacritty/alacritty) - openGL Terminal Emulator ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [weechat](https://weechat.org/) - Extensible IRC client
- [topgrade](https://github.com/topgrade-rs/topgrade) - Auto detect packages to be updated
- [eza](https://github.com/eza-community/eza) - modern replacement to `ls` command
- [procs](https://github.com/dalance/procs) - modern replacement to `ps` command
- [zoxide](https://github.com/ajeetdsouza/zoxide) - modern replacement to `cd` command
- [tealdeer](https://github.com/dbrgn/tealdeer) - modern replacement to `man` help documents ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [gping](https://github.com/orf/gping) - modern replacement to `ping` command
- [broot](https://github.com/Canop/broot) - Navigation for directory trees
- [navi](https://github.com/denisidoro/navi) - crowd sourced cheat sheets in your CLI ↗ [Docs](https://github.com/anil-dewani/dotfiles/wiki)
- [howdoi](https://github.com/gleitz/howdoi) - Technical suggestions in your CLI
- [git-delta](https://github.com/dandavison/delta) - Syntax-highlighting pager for git, diff, and grep output

## 🤙🏻  Fonts

- [SF Symbols](https://developer.apple.com/sf-symbols/)
- [Hack Nerd Font](https://www.nerdfonts.com/)
- [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)
- [Fira Code](https://github.com/tonsky/FiraCode)
- [SF Mono Nerd Font](https://github.com/epk/SF-Mono-Nerd-Font)

## 🌎  Browser

- [Orion](https://kagi.com/orion/) - WebKit Browser Engine
- [Firefox](https://www.mozilla.org/en-US/firefox/new/) - Gecko Browser Engine
- [Tridactyl](https://tridactyl.xyz/) - Vim binding for firefox

<div id="screenshots">
</div>

## 💻 Screenshots

<img width="1280" alt="Screenshot 2023-11-20 at 7 57 12 PM" src="https://github.com/anil-dewani/dotfiles/assets/99182221/42cad56f-daa3-40a6-bb23-d0d760dc5524">
<img width="1280" alt="Screenshot 2023-11-20 at 8 06 46 PM" src="https://github.com/anil-dewani/dotfiles/assets/99182221/cfbae57e-59f5-4465-b8f5-88189b1c3397">
<img width="1280" alt="Screenshot 2023-11-20 at 8 25 16 PM" src="https://github.com/anil-dewani/dotfiles/assets/99182221/1d1969d4-c9a4-4f2e-bbc9-7b17823f760b">
<img width="1280" alt="Screenshot 2023-11-20 at 8 28 05 PM" src="https://github.com/anil-dewani/dotfiles/assets/99182221/56f097f4-25da-406c-b930-5427f725c88c">
<img width="1280" alt="Screenshot 2023-11-20 at 7 54 46 PM" src="https://github.com/anil-dewani/dotfiles/assets/99182221/6123caa4-26a1-4dc1-ac66-d15c312f5ad6">


<div id="install">
</div>

## ⚙️ Installation Script

Open your favorite terminal app and paste the following to initiate installation script

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/anil-dewani/dotfiles/main/install.sh)"
```
The above script will execute following actions on your system:

- Install xcode command-line tools
- Install homebrew package manager
- Setup useful brew tap sources
- Install all dependencies using homebrew
- Install xcode via App store Automatically
- Install Vimari browser via App Store Automatically
- Install Amphetamine via App Store Automatically
- Install global pip packages
- Changes lots of macOS default settings
- Install needed fonts
- Initiate needed brew services
- Prompt to authorize github CLI
- Creates a automated backup of .config folder of home user
- Clones the current repo and populate .config folder of home user
- Replaces .gitconfig and saves a backup
- Replaces .zshrc and saves a backup
- Set a wallpaper
- Prompts to restart the system


Caution: The above script can significantly change your system, so execute it after fully understanding what it actually does.
