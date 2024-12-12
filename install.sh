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

# Check if running as root. If root, script will exit
if [[ $EUID -eq 0 ]]; then
    echo "${ERROR}" "This script should not be executed as root! Exiting.......${RESET}"
    exit 1
read -r 

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
echo "${RED}Welcome to StrinGhost's KaliGhost Install Script!${RESET}"
echo
echo -e "${RED}ATTENTION: ${MAUVE}Run a full system update and Reboot first!! (Highly Recommended) ${RESET}"
echo
echo -e "${RED}NOTE: ${CYAN}After installation, all outputs and errors are saved to '$LOG_FILE'. Please review it if any issues arise!"
echo
echo -e "${RED}NOTE: ${CYAN}If you are installing on a VM, ensure to enable 3D acceleration else you may face issues!"
echo

read -p "${CYAN}Would you like to proceed? (y/n): ${RESET}" proceed
printf "\n%.0s" {1..2}
if [ "$proceed" != "y" ]; then
    echo "Installation aborted."
	printf "\n%.0s" {1..2}
    exit 1
fi

colorize_prompt() {
    local color="$1"
    local message="$2"
    echo -n "${color} ${message}${RESET}"
    echo -e "\n${color}${message}${RESET}\n" &>> "$LOG_FILE"
    printf "\n%.0s" {1..2}
}

cmd_exec() {
    local cmd="$@"   
    # Execute the command and capture both stdout and stderr
    output=$($cmd 2>&1)

    # Check if the command executed successfully
    if [[ $? -ne 0 ]]; then
        echo "$(colorize_prompt "${ERROR}"  "Error: Command '$cmd' failed to execute.")" 
    fi
    echo -e "$output\n\n" &>> "$LOG_FILE"
}

#######################################################################

echo -e "$WELCOME\n\n\n" > "$LOG_FILE"
# Check for sudo permission
if sudo -n true 2>/dev/null; then
    echo "$(colorize_prompt "${OK}"  "Sudo privileges detected.")"
elif sudo -v; then
    echo "$(colorize_prompt "${CAT}"  "Password accepted. Granting sudo permissions.")"
else
    echo "$(colorize_prompt "${ERROR}" "You do not have sudo privileges or failed to provide a valid password.")"
    exit 1
fi

echo "$(colorize_prompt "${CAT}"  "Installing Packages and Dependencies. This may take a while depending on your internet speed...")" 

cmd_exec sudo apt update -y
cmd_exec sudo apt-get install -y zsh python3 npm arandr flameshot arc-theme feh i3 polybar lxappearance python3-pip curl rofi kitty unclutter-xfixes unzip betterlockscreen wtmpdb bat eza net-tools fzf tmux btop ripgrep zoxide xclip gh sassc wget curl
cmd_exec sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev
echo "$(colorize_prompt "${OK}"  "Packages and Dependencies Installed.")" 

# Obsidian
if ! (sudo dpkg -l | grep -q "obsidian" || which obsidian > /dev/null); then
   echo "$(colorize_prompt "${CAT}"  "Installing Obsidian")" 
   cmd_exec wget -q https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb
   cmd_exec sudo dpkg -i obsidian_1.6.7_amd64.deb
   cmd_exec sudo apt install -f -y
   cmd_exec rm obsidian_1.6.7_amd64.deb
   echo "$(colorize_prompt "${OK}"  "Obsidian has been Installed.")" 
fi

# Setting up directories and fonts...
mkdir -p ~/Pictures/screenshots #FlameShot
sudo mkdir -p /usr/share/fonts/nerd-fonts

# Check and install JetBrainsMono Font
if ! (fc-list | grep -qi "JetBrainsMono"); then   
    echo "$(colorize_prompt "${CAT}"  "Installing JetBrainsMono Font.")" 
    cmd_exec wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
    cmd_exec sudo unzip JetBrainsMono.zip -d /usr/share/fonts/nerd-fonts/JetBrainsMono
    rm JetBrainsMono.zip
    cmd_exec sudo fc-cache -f
    echo "$(colorize_prompt "${OK}"  "JetBrainsMono Font has been Installed.")" 
fi


# Copy configuration files
echo "$(colorize_prompt "${CAT}"  "Setting up DotFiles.")" 
cp -r config/* ~/.config/
cp chbg ~/.chbg
cp -r images ~/.images
sudo cp bin/copy "$BIN_PATH/"
if [[ "$PICOM" = "false" ]]; then
  cmd_exec sudo apt install picom # old version of picom
else
  sudo cp bin/picom "$BIN_PATH/"
fi

# Make scripts executable
chmod +x ~/.chbg
chmod +x ~/.config/polybar/launch.sh 
chmod +x ~/.config/rofi/app-launcher/launch.sh
chmod +x ~/.config/rofi/clipboard/launch.sh
chmod +x ~/.config/rofi/power/launch.sh


# Configure Betterlockscreen 
echo "$(colorize_prompt "${OK}"  "Configuring betterlockscreen...")" 
cmd_exec betterlockscreen -u ~/.images/space.jpg

# Install tpm and Configure tmux 
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
   echo "$(colorize_prompt "${CAT}"  "Setting up Tmux TPM")" 
   cmd_exec git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   if [ -f "$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh" ]; then
       cmd_exec bash "$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh"
   fi
fi

# GreenClip
if [ ! -f "$BIN_PATH/greenclip" ]; then
    echo "$(colorize_prompt "${CAT}"  "Installing GreenClip")" 
    cmd_exec wget -q https://github.com/erebe/greenclip/releases/download/v4.2/greenclip 
    chmod +x greenclip
    sudo mv greenclip "$BIN_PATH/greenclip"
fi

# Install Neovim with Nvchad
if [ ! -f "$BIN_PATH/nvim" ]; then
   echo "$(colorize_prompt "${CAT}"  "Installing NeoVim.")" 
   cmd_exec wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O nvim-linux64.tar.gz
   tar -xzf nvim-linux64.tar.gz
   sudo cp -r nvim-linux64/* /usr/local/
   rm -r nvim-linux64.tar.gz nvim-linux64
   echo "$(colorize_prompt "${CAT}"  "Installing NvChad Starter.")" 
   rm -rf ~/.config/nvim
   cmd_exec git clone https://github.com/NvChad/starter ~/.config/nvim
fi

# Install Oh My Posh
if [ ! -f "$BIN_PATH/oh-my-posh" ]; then
  echo "$(colorize_prompt "${CAT}"  "Setting Up Zsh.")" 
  curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d "$BIN_PATH/" 
  cp zshrc ~/.zshrc
fi

# Remove Packages
cmd_exec sudo apt autoremove -y && sudo apt autoclean -y 

clear

echo "$WELCOME"
printf "\n%.0s" {1..2}  
echo -e "$(colorize_prompt "${MAUVE}"  "(+) KaliGhost Installation Completed!")" 
echo -e "$(colorize_prompt "${WARN}"  "all outputs and errors are saved to '$LOG_FILE'. Please review it if any issues arise!")" 

printf "\n%.0s" {1..1}
read -rp "${CAT} Would you like to install Additional Wallpapers? (y/n): " WALL 
if [[ "$WALL" =~ ^[Yy]$ ]]; then
  if git clone "https://github.com/StrinGhost/Wallpaper-Collection.git" --depth 1; then 
      cp -r Wallpaper-Collection/* "$HOME/.images/"
      rm -r Wallpaper-Collection
      echo "$(colorize_prompt "${OK}" "Installed Wallpapers Successfully.")"
  else
      echo "$(colorize_prompt "${ERROR}" "Failed to Clone the Github Repo: 'https://github.com/StrinGhost/Wallpaper-Collection'. Please Manually Install!")"
  fi
fi

# Prompt to Reboot
printf "\n%.0s" {1..1}
read -rp "${CAT} Would you like to reboot now? (y/n): " ANS
if [[ "$ANS" =~ ^[Yy]$ ]]; then
    sudo reboot now
else
    echo "$(colorize_prompt "${MAUVE}"  "Configuration Complete: Manual Reboot Required.")" 
fi


