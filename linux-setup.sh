#!/bin/bash
 
# curl -sSL https://gist.githubusercontent.com/hegemanjr/097ca3ba9e494482d517ee856b503b59/raw/b01191ca02566611e5c080b89f69e73e9aa90ed4/install_apps.sh | bash
 
# Updates
sudo apt update
sudo apt upgrade -y

echo "Change directory to ~/Downloads"
cd ~/Downloads

echo "Install apps with apt and snap"
# Install apps with apt and snap
sudo apt install chromium-browser flameshot virtualbox vagrant gparted handbrake obs-studio gimp filezilla vlc slack -y 
sudo snap install discord youtube-music-desktop-app postman

echo "Install GitKraken"
# Install GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb


echo "Remove previous JetBrains/PhpStorm download(s)"
rm -rf jetbrains-toolbox-*.tar.gz

echo "Download JetBrains/PhpStorm"
# Install JetBrains/PhpStorm
# Download the tarball .tar.gz from the Toolbox App web page https://www.jetbrains.com/toolbox/app/.
URL='https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux'
xdg-open $URL

read -p "Download JetBrains/PhpStorm from https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux, then press any key to continue... " -n1 -s

echo "Unzip and install JetBrains/PhpStorm"
sudo tar -xzf jetbrains-toolbox-*.tar.gz -C /opt
/opt/jetbrains-toolbox-*/jetbrains-toolbox

echo "Install Displaylink and requirements"
URL='https://www.displaylink.com/downloads/ubuntu'
xdg-open $URL
read -p "Download Displaylink from https://www.displaylink.com/downloads/ubuntu, then press any key to continue... " -n1 -s

sudo apt install dkms libdrm-dev -y
unzip "DisplayLink USB Graphics Software for Ubuntu*EXE.zip"
chmod +x displaylink-driver-*.run
sudo ./displaylink-driver-*.run

# echo "Install Timeshift"
# sudo add-apt-repository -y ppa:teejee2008/ppa
# sudo apt-get update
# sudo apt-get install timeshift

# PHP
sudo apt update
sudo apt install php libapache2-mod-php -y
sudo apt install php-mysql
sudo systemctl restart apache2

# WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# adjust clock so it works with Windows dual boot
timedatectl set-local-rtc 1
