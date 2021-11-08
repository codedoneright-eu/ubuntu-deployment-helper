#!/bin/bash
# This module adds nVidia drivers repository
# To remove repository at a later date do the following:
# 1: sudo apt-key list
# 2: identify nVidia key
# 3: sudo apt-key del <nVidia key>
# 4: delete /etc/apt/sources.list.d/nvidia.list

if [ $NVIDIA_DRIVERS = y ]; then
	add-apt-repository ppa:graphics-drivers/ppa
	echo "nVidia PPA added" >> ${DDH_LOG}
else
	echo ""
fi

