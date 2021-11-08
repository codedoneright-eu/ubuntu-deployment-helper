#!/bin/bash
# This module is for proprietary apps it downloads them or installs

if [ $OTHER_APPS = d ]; then
	#Download packages
	wget -c https://download.xnview.com/XnViewMP-linux-x64.deb
	wget -c https://cdn.akamai.steamstatic.com/client/installer/steam.deb
	
	# Copy deb files to user's $home and change owner
	cp *.deb /home/${USERNAME_INSTALL}/
	rm *.deb
	chown ${USERNAME_INSTALL}:${USERNAME_INSTALL} /home/${USERNAME_INSTALL}/*.deb
	chmod +x /home/${USERNAME_INSTALL}/*.deb
	echo "Packages downloaded to ~/ and ready for installation" >> ${DDH_LOG}
elif [ $OTHER_APPS = y ]; then
	#Download packages
	wget -c https://download.xnview.com/XnViewMP-linux-x64.deb
	wget -c https://cdn.akamai.steamstatic.com/client/installer/steam.deb
	
	dpkg -i XnViewMP-linux-x64.deb
	dpkg -i steam.deb
	rm *.deb
	echo "Other packages installed" >> ${DDH_LOG}
else
	echo ""
fi
