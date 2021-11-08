#!/bin/bash

echo ""
echo "Remember to install the following GNOME extensions:" >> ${DDH_LOG}
echo "	Dash to Panel" >> ${DDH_LOG}
echo "	OpenWeather" >> ${DDH_LOG}
echo "	Panel OSD" >> ${DDH_LOG}
echo "	Clipboard indicator" >> ${DDH_LOG}

cp ./data/dash-to-panel-settings.txt /home/${USERNAME_INSTALL}/
chown ${USERNAME_INSTALL}:${USERNAME_INSTALL} /home/${USERNAME_INSTALL}/dash-to-panel-settings.txt

echo "Dash to Panel config has been copied to your Home folder," >> ${DDH_LOG}

