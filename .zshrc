# Source zsh plugins

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
                                                  || source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -d "/opt/homebrew/share/zsh-syntax-highlighting/highlighters" ] && export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters \
                                                                  || export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

[ -d "/opt/homebrew/share/zsh-syntax-highlighting/" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
                                                  || source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases for common dirs
alias home="cd ~"

# System Aliases
alias ..="cd .."
alias x="exit"

# Git Aliases
#alias open="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
alias add="git add"
alias commit="better-commits"
alias pull="git pull"
alias stat="git status"
alias gdiff="git diff HEAD"
alias vdiff="git difftool HEAD"
alias log="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cfg="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias push="git push"
alias g="lazygit"
alias fzf="fzf --ansi"
alias cs='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias du='ncdu -x'
alias top='btop'
alias htop='btop'
alias ping='gping'
alias cheat='navi'
alias history='history 1 -1 | awk '\''{$1=""; print $0}'\'' | sort | uniq | fzf | xargs -I {} zsh -c '\''read -q "REPLY?Run command: {}? (y/n) " && [[ $REPLY == "y" ]] && {}'\'''
alias gitinfo='onefetch'
alias dps='oxker'

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

function howdoi {
  command howdoi $@ | bat --paging=never --color=always
}

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Lock the screen when going afk
alias afk="pmset displaysleepnow"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Put public key on clipboard
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"

# we all need it sometimes.... 
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy | echo '=> Copied to pasteboard.'"

# perform upgrade system-wide
alias upgrade='topgrade'

eval "$(starship init zsh)"
eval $(thefuck --alias)


alias ssh="TERM=xterm-256color ssh"

# bat command integration
export BAT_THEME="1337"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias cat="bat -p --paging=never --color=always"

# Sketchybar interactivity overloads
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

alias n="nnn"
function nnn () {
    command nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
    fi
}

function zen () {
  ~/.config/sketchybar/plugins/zen.sh $1
}

function kill () {
  command kill -KILL $(pidof "$@")
}

function suyabai() {
    echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 /opt/homebrew/Cellar/yabai/HEAD-*/bin/yabai | cut -d ' ' -f 1) /opt/homebrew/Cellar/yabai/HEAD-*/bin/yabai --load-sa" | sudo tee /private/etc/sudoers.d/yabai
}

# initialise broot to handle git staging area and commit changes
function commitx {
    br --conf ~/.config/broot/git-diff-conf.toml --git-status
}

# use broot as replacement to tree command
function tree {
     br -c :pt "$@"
}

# Only load conda into path but dont actually use the bloat that comes with it
export PATH="$HOME/miniforge3/bin:/usr/local/anaconda3/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export NNN_TMPFILE="$HOME/.config/nnn/.lastd"
export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"
export MANPAGER="$(which nvim) +Man!"
export XDG_CONFIG_HOME="$HOME/.config"


# Aliases
alias nano='nvim'
alias vim='nvim'
alias vi='nvim'
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

source /Users/nirakar/.config/broot/launcher/bash/br
alias ls='eza --icons --git -l --all'
alias ld='eza --icons -lD'
alias lf='eza --icons -lF --color=always | grep -v /'
alias lh='eza --icons -dl .* --group-directories-first'
alias ll='eza --icons -al --group-directories-first'
alias lt='eza --icons -al --sort=modified'
alias hs='atuin search -i' 
alias cd='z'

# pnpm
export PNPM_HOME="/Users/nirakar/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# setup for auto completion for poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# Initialize atuin
eval "$(atuin init zsh)"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"


# setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export GEMINI_API_KEY=your_api_key_here
