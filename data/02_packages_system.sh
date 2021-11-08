#!/bin/bash

#System packages
apt install apt-xapian-index -y
apt install cifs-utils -y
apt install expect -y
apt install curl -y
apt install wget -y

echo "System packages have been installed" >> ${DDH_LOG}

