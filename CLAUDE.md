# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS development environment (owner: Anil Dewani / timefractal). Configs are symlinked or copied into place via `install.sh`.

## Setup & Installation

Full system bootstrap (installs Homebrew, 100+ packages, configures macOS defaults, restores configs):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/anil-dewani/dotfiles/main/install.sh)"
```

The Claude Code statusline requires `jq` and expects `.claude/` to be symlinked from `~/dotfiles/.claude` to `~/.claude`.

## Architecture

Configs are organized by tool at the top level. Each directory is self-contained and maps to a `~/.config/<tool>/` target:

- **`nvim/`** — LazyVim-based Neovim config with AI plugins (backseat, gp), telescope, overseer, zen-mode
- **`tmux/`** — tmux with tpm plugin manager, tmux-power theme, fzf integration
- **`yabai/`** — Tiling window manager with helper scripts (`create_spaces.sh`, `refresh_displays.sh`, etc.)
- **`skhd/`** — Hotkey daemon keybindings (pairs with yabai)
- **`sketchybar/`** — Custom macOS status bar with modular items/plugins structure and a C helper for CPU monitoring
- **`alacritty/`** — Terminal emulator config (both TOML and YAML formats)
- **`dooit/`** — Todo TUI app (Python config with Catppuccin theme)
- **`.claude/`** — Claude Code statusline showing model, tokens, cost (INR), context usage, git info

Key top-level files:
- **`.zshrc`** — Shell config with zsh-vi-mode, modern CLI aliases (eza, bat, zoxide, btop), starship prompt, lazygit
- **`.gitconfig`** — Git config using delta as pager (side-by-side, theme: 1337), git-lfs enabled
- **`.macos`** — Extensive macOS system defaults (keyboard repeat, Dock, Finder, Spaces, etc.)
- **`.better-commits.json`** — Conventional commit config (types: feat/fix/docs/refactor/perf/test/build/ci/chore)
- **`install.sh`** — Full system provisioning script

## Conventions

- **Commit style**: Conventional commits with max 70 char title. Scopes: app, shared, server, tools
- **Color theme**: Catppuccin used across btop, broot, dooit, and sketchybar
- **Shell aliases remap core tools**: `ls`→eza, `cd`→zoxide, `cat`→bat, `top`→btop, `ping`→gping, `g`→lazygit
- **Git aliases in .zshrc**: `add`, `commit` (uses better-commits), `pull`, `stat`, `gdiff`, `log`, `push`

## Sketchybar Plugin Architecture

`sketchybar/` has a modular structure worth understanding:
- `sketchybarrc` — Main config that sources items
- `colors.sh` / `icons.sh` — Shared constants
- `items/` — Individual bar item definitions (apple, battery, brew, calendar, cpu, spaces, spotify, wifi, yabai, etc.)
- `plugins/` — Scripts that provide data to items
- `helper/` — Compiled C helper for CPU load monitoring
