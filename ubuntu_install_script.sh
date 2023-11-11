#!/bin/bash

#############################
# stephan Dekker            #
# Unbuntu 22.04.3           #
# installation script V 1.1 #
# ###########################
#  D O  N O T  R U N  A S   # 
# ROOT ROOT ROOT ROOT ROOT  #
#############################

# make shure all software installed is upto date tmake shure i miss no dependencies
sudo apt update -y && sudo apt upgrade -y



# install git and setup git
sudo apt-get install git -y
read -p "Enter your Git username: " username
read -p "Enter your Git email address: " email

git config --global user.name "$username"
git config --global user.email "$email"

ssh-keygen -t ed25519 -C "$email"
ssh-add ~/.ssh/id_ed25519


# install rust
sudo apt install curl -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install the bitwarden client
sudo snap install bitwarden -y

# Install telegram
sudo snap install telegram-desktop -y


echo "
############################
# Just catching my breath! #
############################
"
sleep 1
echo "

#################################
# Time to install some MS stuff #
#################################
"
sleep 1


# install vscode from MS repos
sudo apt-get install wget gpg 
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code


# Install Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-stable.list'
sudo rm microsoft.gpg
sudo apt update && sudo apt install microsoft-edge-stable


# Instal Intune
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ 
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list' 
sudo rm microsoft.gpg

sudo apt update
sudo apt install intune-portal

# # Install a manulally made list of vscode extentions.  
# code --install-extention charliermarsh.ruff --force \
#      --install-extention GitHub.copilot --force \
#      --install-extention GitHub.copilot-chat --force \
#      --install-extention ms-python.black-formatter --force \
#      --install-extention ms-python.python --force \
#      --install-extention ms-python.vscode-pylance --force \
#      --install-extention ms-toolsai.jupyter --force \
#      --install-extention ms-toolsai.jupyter-keymap --force \
#      --install-extention ms-toolsai.jupyter-renderers --force \
#      --install-extention ms-toolsai.vscode-jupyter-cell-tags --force \
#      --install-extention ms-toolsai.vscode-jupyter-slideshow --force \
#      --install-extention ms-vscode-remote.remote-ssh --force \
#      --install-extention ms-vscode-remote.remote-ssh-edit --force \
#      --install-extention ms-vscode.remote-explorer --force \
#      --install-extention rust-lang.rust-analyzer --force 
