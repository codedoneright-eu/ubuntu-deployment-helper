#!/bin/bash

if [ $WALLPAPER = y ]; then
	mkdir /home/${USERNAME_INSTALL}/Pictures/Wallpaper/
	cp ./data/wallpaper/* /home/${USERNAME_INSTALL}/Pictures/Wallpaper/
	chown ${USERNAME_INSTALL}:${USERNAME_INSTALL} -R /home/${USERNAME_INSTALL}/Pictures/Wallpaper/
	echo "Wallpaper copied to /home/${USERNAME_INSTALL}/Pictures/Wallpaper/" >> ${DDH_LOG}
else
	echo ""
fi

