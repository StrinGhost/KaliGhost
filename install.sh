#!/bin/bash

#######################################################################
# Update package database and install packages for Debian-based systems
sudo apt update -y &>> kalighost.out & sudo apt install lolcat figlet -y &>> kalighost.out 
clear
echo "
⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⣖⡶⠀⠀⡆⡴⠒⠒⢦⣄⠀⠲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡔⢂⡄⠀⠀⠀⠀⠀⠀⠀⢰⢍⢸⣜⠀⠀⢸⢀⠃⠀⠀⠀⠙⢦⣀⣹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠩⠊⠁⠀⠀⠀⠀⠀⠀⣼⠎⡆⣿⠀⠀⢸⢸⠀⠀⠀⠀⠀⠈⢉⡿⠋⠉⢢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡴⢫⠋⡆⠀⠀⠀⠀⠀⠀⡇⠀⢇⢫⡠⠤⠒⠛⠉⠙⢦⠀⢀⡠⠎⣿⠀⠀⠀⣱⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢰⡅⢸⡰⡇⠀⠀⠀⠀⠀⠀⣾⡴⠋⠁⠀⠀⠀⠀⠀⠀⡠⠕⢭⠀⠀⢳⣋⡖⠉⠳⣗⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡌⡇⢸⢁⡇⠀⠀⠀⠀⠀⢸⣙⡇⠀⠀⠀⠀⢀⣴⣿⣿⣦⠀⠘⣆⣀⣼⢳⡀⠀⠀⣸⡷⡻⣟⣒⣢⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡇⡇⢸⣼⡇⠀⠀⠀⠀⠀⠸⣼⣱⣶⣶⣦⡔⠚⢿⣷⠯⠞⣠⢗⣿⣿⡏⣸⣿⣷⣶⣿⡴⠿⢟⣉⢝⣒⣭⣷⡤⠶⠖⠶⡶⢤⣤⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⢰⠇⡷⡟⠹⡇⠀⠀⠀⠀⠀⠀⢱⢷⠻⠿⠟⡟⣦⣀⠰⡀⢸⡟⠛⣿⣿⢡⣿⣿⣿⣿⣿⣾⣾⣿⣷⣄⠀⠀⡀⠈⠉⠒⠤⠬⣀⣀⢈⣿⣷⣄⡀⠀⠀⠀
⠀⠀⢸⢱⣿⡇⠁⡇⠀⠀⠀⠀⠀⠀⠀⠙⠓⠮⣦⡻⠚⠋⠀⠡⣨⡇⢀⣿⡏⣾⣿⣿⠟⣻⣿⣿⣿⣿⢿⣿⣷⣶⣾⣿⣷⣦⣤⣶⠶⠋⠉⢉⣲⡭⠭⢷⣦⡀
⠀⠀⢸⣾⣹⣷⠒⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣤⣤⣴⣾⠟⣡⣾⣿⣽⡿⠋⠁⢀⣵⣿⣿⡿⠋⠈⡃⣨⣿⣿⣿⣟⣯⣿⣿⣦⣀⣼⡿⠁⠐⠢⡄⠀⠂
⠀⠀⢸⣏⣟⣿⣴⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣷⣬⣭⣴⣾⣿⣿⠟⠉⠀⠀⣠⣾⣿⡿⠋⠀⣠⠞⢪⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠸⡀⠀
⠀⠀⣾⡼⣫⡾⢿⣯⣿⡿⠀⠀⠀⠀⠀⠀⠀⣼⣿⣷⣿⣿⣻⣿⣿⣿⠋⢀⣠⢴⣯⣾⣿⡿⠃⢀⠜⠁⣠⣾⡿⠁⠀⣿⣯⣟⢿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠸⠀
⠀⢸⠯⣽⢉⣾⡟⠉⢻⡏⠀⠀⠀⠀⠀⠀⢸⣿⣿⣶⣿⢿⣿⣿⣿⣓⣛⣭⣔⣽⣿⣿⡿⢋⡽⠁⣠⣾⣿⢟⡁⡠⠊⠸⣿⠙⠻⣯⡿⠁⠀⠀⠀⠀⠀⠀⠀⠇
⠀⢸⠀⢸⡟⠙⡇⠁⢸⠁⠀⠀⠀⠀⢀⣿⣉⣿⣿⣿⣯⣗⡪⠭⣉⣻⠛⣻⣾⣿⣿⣫⡶⠉⣠⣾⣿⠟⢁⣾⣿⠾⠛⣧⠘⣇⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄
⠀⢸⡠⢼⠃⠀⢹⣿⡞⠀⠀⠀⠀⠀⣼⣽⡏⠻⣍⡙⣿⢷⡛⢻⡿⣶⣽⣿⡿⣿⡿⠋⣠⣾⣿⡿⡡⢰⣿⠟⠀⠀⠀⠘⣧⠘⣷⠃⠀⠀⠀⠀⠀⠀⠀⢀⡾⠃
⠀⢸⠁⠀⠇⠀⣼⡿⠁⠀⠀⠀⠀⣼⣿⢏⡘⢦⡈⠛⠿⣮⣉⣡⡤⠺⣻⣯⡾⠋⣠⢺⣿⣿⠋⠀⠀⣀⠨⢧⣤⠀⠠⠄⢹⡿⠃⠀⠀⠀⠀⠀⠀⠀⣴⠋⠀⠀
⠀⢸⠀⠀⡇⠀⡏⠀⠀⠀⠀⠀⣴⢿⢹⣿⡉⠑⠛⠂⠀⠀⠁⠐⠉⠉⢔⣉⣤⣾⣿⣿⣿⡁⠂⡤⠋⠀⠈⠈⣇⡀⣀⣰⣿⠁⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀
⠀⠘⣷⢮⠶⠾⠟⢳⠀⠀⠀⠸⣿⢯⣑⣾⣯⣿⣒⡶⠤⡤⢤⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣥⡾⢿⣿⣲⠦⣤⣽⣿⣿⠈⠻⣷⡄⠀⠀⠀⢀⣾⠇⠀⠀⠀⠀⠀
⠀⠰⣇⣠⡧⠤⠖⠺⡇⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣻⡿⠿⢛⣿⣿⣿⢿⣿⣿⣿⡿⢻⣟⣅⣠⡀⠈⠉⠛⠚⠛⠁⠸⡇⠀⠀⠹⣄⣴⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⢹⡀⠀⠀⠀⠀⢳⠀⠀⢨⠿⣿⣿⣿⣿⣿⣿⣿⣤⣾⣿⣿⣿⣿⣶⠛⠉⠀⢀⣿⠟⠭⠭⠽⠶⣾⠷⣤⣀⣀⠀⣷⠀⢀⣐⣿⣿⣿⣿⣿⣗⠀⠀⠀⠀⠀
⠀⠀⠀⡇⠀⠀⠀⠀⠈⢧⡴⠋⠀⣿⡈⢿⣿⣿⣿⣿⣿⣿⠛⠉⠘⣿⣿⣦⠀⢀⣾⡇⣿⠀⠀⠀⠀⠈⠉⢳⣿⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠦⣶⠀⠀
⠀⠀⠀⢳⠀⠀⠀⠀⠀⠘⣿⣶⣤⣸⡇⠈⢿⣿⣿⣿⣿⣿⣧⡀⠀⣹⣿⣿⣷⣾⡏⠐⠛⠀⢠⠀⢠⣾⢀⠞⡏⠀⠈⡯⠙⣿⡿⣻⠁⠀⠹⣧⠈⠁⠀⢹⡄⠀
⠀⠀⠀⠸⡄⠀⠀⠀⠀⠀⠘⣿⣯⡙⠃⠀⠈⢿⣿⣿⡟⠘⣿⣿⣿⣿⣿⡿⢻⣿⡗⠄⠀⢰⡃⠀⠘⣣⢻⣼⠃⠀⢸⡇⡿⣿⣧⣽⣀⠀⠀⢹⡆⠰⣶⣦⣧⠀
⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠈⠉⢷⡄⠀⠀⠘⢿⡟⠀⠀⠈⠛⠛⠻⡍⠀⢸⣿⠁⠀⠀⣆⠱⢄⣴⣥⣺⣟⠀⠀⡿⠉⢠⢻⠈⣿⣿⣷⣶⣶⣷⣖⣿⣿⣾⡀
⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⠹⣦⣠⢹⡿⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⠄⠀⠀⢸⣴⣿⣿⣿⣿⣹⠀⣸⢣⡇⢈⡟⢠⣿⡏⢿⣿⣿⣿⣿⣿⣿⣿⡇
⠀⠀⠀⠀⠀⠹⣆⠀⠀⠀⠀⠀⠀⠀⠀⢻⠬⡾⠁⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⢾⠆⡰⣿⣿⣿⣿⣿⣿⣾⣰⣯⣮⣄⣼⠃⣾⣿⠀⣼⡟⢿⣏⣿⣿⠿⠛⠃
⠀⠀⠀⠀⠀⠀⠙⣦⠀⠀⠀⠀⠀⠀⠀⣸⣰⠃⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣷⣼⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣰⡿⠈⢠⣿⢷⡄⠙⢿⣏⠀⠀⠀
⠀⠀⠀⢀⣀⣀⠀⠘⣷⡀⡀⠀⢀⣠⣾⠿⠿⣷⠶⢶⡿⠿⢷⣶⣀⣀⣻⣿⡟⢳⣽⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⡿⢠⠀⣼⡟⠀⠹⣦⠀⣾⠀⠀⠀
⠀⠀⡴⠫⣿⠏⣉⣹⠉⠻⠶⠚⠋⣹⠁⠀⢸⡇⠀⢸⣤⣤⣤⡟⠉⢉⣿⠋⢡⣀⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣴⣿⠁⠀⠀⠈⠀⢹⡄⠀⠀
⢀⢞⣴⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⣿⣷⣶⣿⡇⠀⣾⣿⣿⣿⡇⠀⣸⡏⠀⢠⡾⣳⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢀⠀⠀⠀⠀⠀⢷⠀⠀
⢈⠎⡏⣿⣿⣾⡀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⡇⠀⣿⣿⣿⣿⡇⢀⡿⠀⣠⡿⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⢸⠀⠀
⢠⠀⣷⣿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⣿⣾⠃⣰⣽⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⢸⠀⠀
⢸⢤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡟⠀⠀
⠈⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀
⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀
⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⠉⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠙⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇⠀⠰⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿" | lolcat
echo -e "\n\n\n"
echo "$(figlet -f slant 'KaliGhost')" | lolcat
echo -e "\n\n\n"
echo "##################################################
#  ____ ____ ____
# ╭━━━┳━━━╮  StrinGhost
# ┃╭━╮┃╭━╮┃  https://www.github.com/StrinGhost
# ┃╰━━┫┃╱╰╯  https://www.reddit.com/u/StrinGhost
# ╰━━╮┃┃╭━╮  https://x.com/StrinGhost
# ┃╰━╯┃╰┻━┃  https://discord.gg/wtymSq5c
# ╰━━━┻━━━╯
##################################################" | lolcat
echo -e "\n\n\n"

echo "Updating package database and installing essential packages..." | lolcat
sudo apt-get install -y zsh python3 npm arandr flameshot arc-theme feh i3 polybar lxappearance python3-pip rofi kitty unclutter-xfixes papirus-icon-theme neofetch picom betterlockscreen wtmpdb bat eza net-tools fzf tmux open-vm-tools btop ripgrep gh  &>> kalighost.out
sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev &>> kalighost.out

# install Alacritty & Obsidian
if sudo dpkg -l | grep -q "obsidian" || which obsidian > /dev/null; then
   echo "Obsidian already Installed." | lolcat
else
   echo "Installing Obsidian" | lolcat
   wget -q https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb &>> kalighost.out
   sudo dpkg -i obsidian_1.6.7_amd64.deb &>> kalighost.out
   sudo apt install -f -y &>> kalighost.out
   rm obsidian_1.6.7_amd64.deb
fi

# Install pywal using pip
echo "Installing pywal..." | lolcat
pip3 install pywal &>> kalighost.out

# make directories 
echo "Setting up directories and fonts..." | lolcat
mkdir ~/.config
mkdir ~/Pictures/screenshots
sudo mkdir -p /usr/share/fonts/nerd-fonts

# Check and install JetBrainsMono Font
if fc-list | grep -qi "JetBrainsMono"; then
    echo "JetBrainsMono Font already installed" | lolcat
else
    echo "Installing JetBrainsMono font" | lolcat
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -O JetBrainsMono.zip &>> kalighost.out
    unzip JetBrainsMono.zip -d /usr/share/fonts/nerd-fonts/JetBrainsMono &>> kalighost.out
    rm JetBrainsMono.zip
fi

# Check and install Hack Nerd Font
if fc-list | grep -qi "Hack"; then
    echo "Hack Nerd Font already installed" | lolcat
else
    echo "Installing Hack Nerd font" | lolcat
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip &>> kalighost.out
    unzip Hack.zip -d /usr/share/fonts/nerd-fonts/Hack &>> kalighost.out
    rm Hack.zip
fi
sudo fc-cache -f

# Copy configuration files
echo -e "\nCopying configuration files..." | lolcat
cp -r config/* ~/.config/
chmod +x chbg
cp chbg ~/.chbg
cp -r images ~/.images
sudo cp -r /usr/bin/batcat /usr/bin/cat
sudo cp -r /usr/bin/eza /usr/bin/ls
sudo cp nord.rasi /usr/share/rofi/themes/
sudo cp -r copy /usr/local/bin/


# Make scripts executable
sudo chmod +x ~/.config/polybar/launch.sh
sudo chmod +x ~/.config/i3/clipboard_fix.sh 
sudo chmod +x ~/.config/rofi/power/powermenu.sh


# Configure Betterlockscreen 
echo "Configuring betterlockscreen..." | lolcat
sudo betterlockscreen -u ~/.images/0.jpeg &>> kalighost.out

# Install tpm and Configure tmux
if [ -d "~/.tmux/plugins/tpm" ]; then
   echo "tpm already installed." | lolcat
else
   echo "Installing tpm..." | lolcat
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &>> kalighost.out
   echo "Installing Tmux plugins..." | lolcat 
   if [ -f "~/.tmux/plugins/tpm/scripts/install_plugins.sh" ]; then
       bash " ~/.tmux/plugins/tpm/scripts/install_plugins.sh" &>> kalighost.out
   fi
fi

# Install Neovim with Nvchad
if [ -d "/opt/nvim" ]; then
   echo "Neovim Already installed" | lolcat
else
   echo "Installing Neovim" | lolcat
   wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O nvim-linux64.tar.gz &>> kalighost.out
   sudo tar -C /opt -xzf nvim-linux64.tar.gz
   sudo mv /opt/nvim-linux64 /opt/nvim
   rm nvim-linux64.tar.gz
   echo "Installing NvChad after installation completes. Run 'nvim' to download plugins then ':MasonInstallAll'." | lolcat
   git clone https://github.com/NvChad/starter ~/.config/nvim &>> kalighost.out
fi

# Install Oh My Zsh
echo "Installing Oh My Zsh..." | lolcat
sh -c "$(curl -fsSL https://install.ohmyz.sh)" "" --unattended &>> kalighost.out
cp zshrc ~/.zshrc
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

# Remove Packages
#sudo apt remove --purge qterminal thunar
sudo apt autoremove -y && sudo apt autoclean -y 

# Prompt user to update packages
echo -e "\n\n\n(Recommended) Do you want to update the packages (y/n):" | lolcat
read -r upackage

# Check user input and take action
if [[ "$upackage" == "n" || "$upackage" == "N" ]]; then
    echo -e "\nPlease update your packages after a reboot using the command 'sudo apt update && sudo apt upgrade'" | lolcat
else
    echo "Updating Packages" | lolcat
    sudo apt update  -y &>> kalighost.out
    echo -e "\nUpgrading Packages this may take sometime to complete\n" | lolcat
    sudo apt upgrade -y 
    clear
fi

# Prompt user for reboot
echo -e "\n\n(StrinGhost) (+) KaliGhost Installation Completed!\n\nOutputs saved in kalighost.out in case of any error consider checking it out." | lolcat
echo -e "\nReboot required to see the changes. Do you want to reboot now (y/n):" | lolcat
read -r option

# Check user input and take action
if [[ "$option" == "y" || "$option" == "Y" ]]; then
    echo "Rebooting the system now..." | lolcat
    sudo reboot now
else
    echo "Configuration complete: Manual reboot required." | lolcat
fi
