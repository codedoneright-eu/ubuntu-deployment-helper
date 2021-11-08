#!/bin/bash
# This module is for proprietary apps it downloads them to your user's ~/

#You can download more software by adding additional lines like so:
#wget -c https://link-to-software.com/software.deb

if [ $OTHER_APPS = d ]; then
	wget -c https://download.xnview.com/XnViewMP-linux-x64.deb
	
	# Copy deb files to user's $home and change owner
	cp *.deb /home/${USERNAME_INSTALL}/
	rm *.deb
	chown ${USERNAME_INSTALL}:${USERNAME_INSTALL} /home/${USERNAME_INSTALL}/*.deb
	chmod +x /home/${USERNAME_INSTALL}/*.deb
	echo "Packages downloaded to ~/ and ready for installation" >> ${DDH_LOG}
elif [ $OTHER_APPS = y ]; then
	wget -c https://download.xnview.com/XnViewMP-linux-x64.deb
	dpkg -i XnViewMP-linux-x64.deb
	rm *.deb
	echo "Other packages installed" >> ${DDH_LOG}
else
	echo ""
fi

