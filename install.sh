#!/bin/bash
#Version: 0.9
#Additional information available in read.me file

clear

echo "Ubuntu Deployment Helper for Ubuntu 20.04 (Focal Fossa)"
echo ""
echo "Changelog and additional information available in read.me file"

echo ""
read -p "Press enter to continue or Ctrl+C to abort " foo

#Collect information from user
clear

echo "Please answer a few questions so that the script can tailor the experience"
echo "to your needs."
echo ""
echo "Yes/No prompts should be answered with a lowercase y/n."

#Check username for uid=1000
USERNAME_INSTALL="$(cat /etc/passwd | grep 1000 | awk -F: '{print $1}')"

#Ask if the user wants to install additional script files
echo ""
read -p "Would you like to install additional script files (y/n)? " SCRIPT_INSTALL

#Check if the user wants to add a network share
echo ""
read -p "Would you like to mount a network share (y/n)? " SHARE_INSTALL

	if [ $SHARE_INSTALL = y ]; then
		echo ""
		echo "Please provide..."
		read -p "Folder name for the share to be created in ~/ : " SHARE_FOLDER
		read -p "Network file share path: " SHARE_PATH
	else
		echo ""
	fi

#Ask if the user wants to add VPN
echo ""
read -p "Would you like to install VPN service? (y/n): " VPN_INSTALL

#Ask if the user wants to add spotify repository
echo ""
read -p "Would you like to add Spotify repository? (y/n): " SPOTIFY

#Ask if the user wants to add Signal repository
echo ""
read -p "Would you like to add Signal repository? (y/n): " SIGNAL

#Ask if the user wants to add nVidia drivers PPA
echo ""
read -p "Would you like to add nVidia repository? (y/n): " NVIDIA_DRIVERS

#Ask if the user wants to install other apps
echo ""
read -p "Would you like to install or download other apps? (y/d/n): " OTHER_APPS

#Ask if the user wants to copy the wallpaper
echo ""
read -p "Would you like to copy wallpaper to ~/Pictures/Wallpaper/? (y/n): " WALLPAPER

#Ask user if wants to reboot when finished
echo ""
read -p "Would you like to shutdown the system when finished? (y/n): " SHUTDOWN_NOW

#Display summary
clear

echo "Please check the summary below..."
echo ""
echo "Username:                          ${USERNAME_INSTALL}"
echo "Additional script installation:    ${SCRIPT_INSTALL}"
echo "Network share added:               ${SHARE_INSTALL}"
	if [ $SHARE_INSTALL = y ]; then
		echo "NFS share folder to create:        ${SHARE_FOLDER}"
		echo "NFS share path:                    ${SHARE_PATH}"
	else
		echo "                                   no changes to fstab"
	fi
echo "Setup VPN files:                   ${VPN_INSTALL}"
echo "Install Spotify repository:        ${SPOTIFY}"
echo "Install Signal repository:         ${SIGNAL}"
echo "Add nVidia PPA:                    ${NVIDIA_DRIVERS}"
echo "Copy wallpaper:                    ${WALLPAPER}"
echo "Install other apps:                ${OTHER_APPS}"
echo "Shutdown after finishing:          ${SHUTDOWN_NOW}"
echo ""
echo "Script will start working on your system after this prompt."
echo "Time needed for completion depends on your system and internet speed"
echo ""
echo "Log file will be created in /home/${USERNAME_INSTALL}/ddh-log.txt"
echo ""
read -p "Press enter to continue or Ctrl+C to abort " foo

#Script starts actual work here
clear

#Create log
touch /home/${USERNAME_INSTALL}/ddh-log.txt
chown ${USERNAME_INSTALL}:${USERNAME_INSTALL} /home/${USERNAME_INSTALL}/ddh-log.txt

DDH_LOG=/home/${USERNAME_INSTALL}/ddh-log.txt

echo "Ubuntu Deployment Helper log
============================
" >> ${DDH_LOG}

#Export variables for use with other modules
export USERNAME_INSTALL
export SCRIPT_INSTALL
export SHARE_INSTALL
export SHARE_FOLDER
export SHARE_PATH
export VPN_INSTALL
export SPOTIFY
export SIGNAL
export NVIDIA_DRIVERS
export DDH_LOG
export WALLPAPER
export OTHER_APPS

#Connect to the internet by establishing connection
apt update
apt upgrade -y

echo "System is up to date" >> ${DDH_LOG}

#Install GUI + utilities
./data/02_packages_system.sh
./data/04_packages_utilities.sh

#Install additional script files and create aliases for them
./data/05_add_script.sh

#Amend fstab for network share
./data/06_shares.sh

#Add aliases
./data/07_alias.sh

#Add vpn
./data/08_vpn.sh

#Add spotify repository
./data/09_spotify.sh

#Download other apps
./data/10_other_apps.sh

#Install nVidia drivers
./data/11_nvidia.sh

#Add spotify repository
./data/12_signal.sh

#Put wallpaper in the correct place for immediate use
./data/13_wallpaper.sh

# Put reminders to DDH_LOG
./data/14_reminders.sh

#Shutdown section
if [ $SHUTDOWN_NOW = y ]; then
	shutdown now
else
	echo ""
	echo "Script has finished, please reboot your system..."
fi

echo ""

