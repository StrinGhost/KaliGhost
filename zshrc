######################################################
#  ____ ____ ____                                    #
#    ╭━━━┳━━━╮  StrinGhost                           #
#    ┃╭━╮┃╭━╮┃                                       #
#    ┃╰━━┫┃╱╰╯  https://www.github.com/StrinGhost    #
#    ╰━━╮┃┃╭━╮  https://www.reddit.com/u/StrinGhost  #
#    ┃╰━╯┃╰┻━┃  https://x.com/StrinGhost             #
#    ╰━━━┻━━━╯                                       #
######################################################

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.toml)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

# Aliases
alias ls="eza"
alias cat="bat"

alias msf="msfconsole"
alias sploit="searchsploit"
alias ferox="feroxbuster -x php pem pam html js css bak xxx old zip txt -o feroxbuster.log --url"
alias autorec="autorecon --exclude-tags dirbuster,feroxbuster,dirsearch,ffuf,dirb -v --heartbeat 10"
alias vim='nvim'
alias c='clear'
alias ll='ls -la'
alias files='thunar'
alias htb-connect='openvpn ~/Desktop/ovpn/htb.ovpn > ~/Desktop/ovpn/logs/htb-ovpn.log 2>&1 &'
alias thm-connect='openvpn ~/Desktop/ovpn/thm.ovpn > ~/Desktop/ovpn/logs/thm-ovpn.log 2>&1 &'

alias fetch='fastfetch'
alias icat='kitten icat'

cheat() {
	if [[ -z "$1" ]]; then
		echo "Usage: cheat <command>"
	else
		curl -s "cht.sh/$1"
	fi
}

up_target() {
  if [ -n "$1" ]; then
    echo "$@" > ~/target
    echo "Data updated in ~/target"
  else
    echo "No data provided. ~/target not updated."
  fi
}

if [[ -f ~/target ]];then
   export ip=$(awk '{print $1}' ~/target)
   alias target='up_target'
fi

# shell integration
eval "$(zoxide init zsh)"
source <(fzf --zsh)


# startup
fastfetch
