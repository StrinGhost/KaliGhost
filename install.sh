#!/bin/bash
# https://github.com/StrinGhost

# Colors
OK="$(tput setaf 2 bold)[OK]"
ERROR="$(tput setaf 1 bold)[ERROR]"
WARN="$(tput setaf 5 bold)[WARN]"
CAT="$(tput setaf 6 bold)[ACTION]"
RESET="$(tput sgr0)"

RED=$(tput setaf 203 bold)
CYAN=$(tput setaf 6 bold)
MAUVE="\e[38;2;203;166;247;1m"

LOG_FILE='kalighost.out'
BIN_PATH='/usr/local/bin'

if [[ $1 == "--no-picom" ]]; then
  PICOM=false
else
  PICOM=true
fi

# Check if running as root
if [[ $EUID -eq 0 ]]; then
  echo -e "${ERROR} This script should not be executed as root! Exiting...${RESET}"
  exit 1
fi

clear

# Welcome message
WELCOME="${CYAN}
######################################################
#  ____ ____ ____                                    #
#    ╭━━━┳━━━╮  ${RED}StrinGhost${CYAN}                           #
#    ┃╭━╮┃╭━╮┃                                       #
#    ┃╰━━┫┃╱╰╯  ${RED}https://www.github.com/StrinGhost${CYAN}    #
#    ╰━━╮┃┃╭━╮  ${RED}https://www.reddit.com/u/StrinGhost${CYAN}  #
#    ┃╰━╯┃╰┻━┃  ${RED}https://x.com/StrinGhost${CYAN}             #
#    ╰━━━┻━━━╯                                       #
######################################################${RESET}"
echo "$WELCOME"  
echo
echo -e "${RED}Welcome to StrinGhost's KaliGhost Install Script!${RESET}"
echo
echo -e "${RED}ATTENTION: ${MAUVE}Run a full system update and reboot first! (Highly Recommended)${RESET}"
echo
echo -e "${RED}NOTE: ${CYAN}After installation, all outputs and errors are saved to '$LOG_FILE'.${RESET}"
echo
echo -e "${RED}NOTE: ${CYAN}If you are installing on a VM, enable 3D acceleration to avoid issues.${RESET}"
echo

read -p "${CYAN}Would you like to proceed? (y/n): ${RESET}" proceed
if [[ $proceed != "y" ]]; then
  echo "Installation aborted."
  exit 1
fi

# Helper functions
colorize_prompt() {
  local color="$1"
  local message="$2"
  echo -e "${color}${message}${RESET}"
  echo -e "${color}${message}${RESET}" >> "$LOG_FILE"
}

cmd_exec() {
  local cmd="$@"
  output=$($cmd 2>&1)
  if [[ $? -ne 0 ]]; then
    colorize_prompt "${ERROR}" "Command '$cmd' failed to execute."
  fi
  echo "$output" >> "$LOG_FILE"
}

echo -e "$WELCOME\n\n" > "$LOG_FILE"

# Check sudo privileges
if sudo -n true 2>/dev/null; then
  colorize_prompt "${OK}" "Sudo privileges detected."
elif sudo -v; then
  colorize_prompt "${CAT}" "Password accepted. Granting sudo permissions."
else
  colorize_prompt "${ERROR}" "Sudo privileges not granted."
  exit 1
fi

# Install dependencies
colorize_prompt "${CAT}" "Installing packages and dependencies..."
cmd_exec sudo apt update -y
cmd_exec sudo apt-get install -y zsh python3 npm arandr flameshot arc-theme feh i3 polybar \
  lxappearance python3-pip curl rofi kitty unclutter-xfixes unzip betterlockscreen wtmpdb \
  bat eza net-tools fzf tmux btop ripgrep zoxide xclip gh sassc wget

# Obsidian installation
if ! dpkg -l | grep -q obsidian; then
  colorize_prompt "${CAT}" "Installing Obsidian..."
  cmd_exec wget -q https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb
  cmd_exec sudo dpkg -i obsidian_1.6.7_amd64.deb
  cmd_exec sudo apt install -f -y
  rm obsidian_1.6.7_amd64.deb
  colorize_prompt "${OK}" "Obsidian installed."
fi

# Fonts setup
colorize_prompt "${CAT}" "Setting up JetBrainsMono Nerd Font..."
if ! fc-list | grep -qi "JetBrainsMono"; then
  cmd_exec wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
  cmd_exec sudo unzip -q JetBrainsMono.zip -d /usr/share/fonts/nerd-fonts/JetBrainsMono
  rm JetBrainsMono.zip
  cmd_exec sudo fc-cache -f
  colorize_prompt "${OK}" "JetBrainsMono installed."
fi

# Dotfiles and scripts
colorize_prompt "${CAT}" "Copying configuration files..."
mkdir -p ~/.config
cp -r config/* ~/.config/
chmod +x ~/.config/polybar/launch.sh

# Final cleanup and reboot prompt
cmd_exec sudo apt autoremove -y
clear

colorize_prompt "${MAUVE}" "KaliGhost installation completed!"
read -p "${CAT} Would you like to reboot now? (y/n): " reboot_ans
if [[ $reboot_ans =~ ^[Yy]$ ]]; then
  sudo reboot
else
  colorize_prompt "${MAUVE}" "Manual reboot required."
fi
