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
  echo -e "${color} ${message}${RESET}"
  echo -e "${color} ${message}${RESET}" >> "$LOG_FILE"
}

cmd_exec() {
  local cmd="$@"
  colorize_prompt "${RED}" "Executing: $cmd"
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
cmd_exec sudo apt-get install -y zsh python3 npm arandr flameshot arc-theme feh i3 polybar picom \
  lxappearance python3-pip curl rofi kitty unclutter-xfixes unzip betterlockscreen wtmpdb \
  bat eza net-tools fzf tmux btop ripgrep zoxide xclip gh sassc wget

# Obsidian installation
if ! dpkg -l | grep -q obsidian; then
  colorize_prompt "${CAT}" "Installing Obsidian..."
  cmd_exec wget -q https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.10/obsidian_1.8.10_amd64.deb
  cmd_exec sudo dpkg -i obsidian_1.8.10_amd64.deb
  cmd_exec sudo apt install -f -y
  rm obsidian_1.8.10_amd64.deb
  colorize_prompt "${OK}" "Obsidian installed."
fi

mkdir -p ~/Pictures/screenshots #FlameShot
sudo mkdir -p /usr/share/fonts/nerd-fonts/JetBrainsMono

# Fonts setup
colorize_prompt "${CAT}" "Setting up JetBrainsMono Nerd Font..."
if ! fc-list | grep -qi "JetBrainsMono"; then
  cmd_exec wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  cmd_exec sudo unzip -q JetBrainsMono.zip -d /usr/share/fonts/nerd-fonts/JetBrainsMono
  rm JetBrainsMono.zip
  cmd_exec sudo fc-cache -f
  colorize_prompt "${OK}" "JetBrainsMono installed."
fi

# Dotfiles and scripts
colorize_prompt "${CAT}" "Copying configuration files..."
mkdir -p ~/.config

cp -r config/* ~/.config/
cp chbg ~/.chbg
cp -r images ~/.images
sudo cp copy "$BIN_PATH/"


# Configure Betterlockscreen 
colorize_prompt "${CAT}"  "Configuring betterlockscreen..."
cmd_exec betterlockscreen -u ~/.images/space.jpg

# Install tpm and Configure tmux 
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
   colorize_prompt "${CAT}"  "Setting up Tmux TPM"
   cmd_exec git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   if [ -f "$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh" ]; then
       cmd_exec bash "$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh"
   fi
fi

# GreenClip
if [ ! -f "$BIN_PATH/greenclip" ]; then
    colorize_prompt "${CAT}"  "Installing GreenClip..."
    cmd_exec wget -q https://github.com/erebe/greenclip/releases/download/v4.2/greenclip 
    chmod +x greenclip
    sudo mv greenclip "$BIN_PATH/greenclip"
fi

# Install Neovim with Nvchad
if [ ! -f "$BIN_PATH/nvim" ]; then
   colorize_prompt "${CAT}"  "Installing NeoVim..."
   cmd_exec wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz -O nvim-linux64.tar.gz
   tar -xzf nvim-linux64.tar.gz
   sudo cp -r nvim-linux64/* /usr/local/
   rm -r nvim-linux64.tar.gz nvim-linux64
   colorize_prompt "${CAT}"  "Installing NvChad Starter..."
   rm -rf ~/.config/nvim
   cmd_exec git clone https://github.com/NvChad/starter ~/.config/nvim
fi

# Install Oh My Posh
if [ ! -f "$BIN_PATH/oh-my-posh" ]; then
  colorize_prompt "${CAT}"  "Setting Up Zsh..."
  curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d "$BIN_PATH/" 
  cp zshrc ~/.zshrc
fi


# Final cleanup and reboot prompt
cmd_exec sudo apt autoremove -y
clear

colorize_prompt "${MAUVE}" "KaliGhost installation completed!"

read -p "${CAT} Would you like to install Additional Wallpapers? (y/n): " WALL
if [[ $WALL =~ ^[Yy]$ ]]; then
      cmd_exec wget -q https://github.com/StrinGhost/Wallpaper-Collection/releases/download/latest/Wallpaper-Collection.zip
      cmd_exec unzip -q Wallpaper-Collection.zip -d -o "$HOME/.images/"
      rm -r Wallpaper-Collection.zip
      colorize_prompt "${OK}" "Installed Wallpapers Successfully."
fi

read -p "${CAT} Would you like to reboot now? (y/n): " reboot_ans
if [[ $reboot_ans =~ ^[Yy]$ ]]; then
  sudo reboot
else
  colorize_prompt "${MAUVE}" "Manual reboot required."
fi