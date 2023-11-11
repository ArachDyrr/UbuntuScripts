#!/bin/bash

#############################
# stephan Dekker            #
# Unbuntu 22.04.3           #
# installation script V 1.1 #
# ###########################
#  D O  N O T  R U N  A S   # 
# ROOT ROOT ROOT ROOT ROOT  #
#############################

# make shure all software installed is upto date and to make shure I miss no dependencies.
sudo apt update -y && sudo apt upgrade -y

# Instal general dependencies.
sudo apt install curl wget gpg -y

# install git and setup git
sudo apt-get install git -y
read -p "Enter your Git username: " username
read -p "Enter your Git email address: " email

git config --global user.name "$username"
git config --global user.email "$email"

ssh-keygen -t ed25519 -C "$email"
ssh-add ~/.ssh/id_ed25519


# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install the bitwarden client
sudo snap install bitwarden -y

# Install telegram
sudo snap install telegram-desktop -y


sleep 1
echo "

#################################
# Time to install some MS stuff #
#################################
"
sleep 1

# Install MS tools. 

# Setup vscode from MS repos
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Setup Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-stable.list'
sudo rm microsoft.gpg

# Setup Intune
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ 
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list' 
sudo rm microsoft.gpg

# Install Code, Edge and Intune
sudo apt update && sudo apt install -y apt-transport-https code microsoft-edge-stable intune-portal 
