Ubuntu Deployment Helper for Ubuntu 20.04 (Focal Fossa)
=========================================================
This is a bash script that streamlines the deployment of a fresh Ubuntu 20.04 
install. The assumption is that the user installed a minimal version without
additional packages, to make the system as lightweight as possible, and then
tweak it with the help of this script.

User is expected to run this script after first login and reboot to have all
features already available. User will just need to log into services or setup
email accounts in Thunderbird.

Installed software is tailored to my needs, you can change the following files
to tailor the experience to your needs:

02_packages_system.sh - basic system packages
04_packages_utilities.sh - all other software
10_other_apps.sh - software from outside the repository, downloads .deb files

The last function is useful only if latest release has always the same filename!

I wasted a lot of time to actually use this script as intended once or twice, 
but it was fun and I learned about bash and task automation.

You can also use this script as a basis for YOUR custom build. Experiment, enjoy
and I hope you learn something


Current functionality
=========================================================
1: Update the system
2: Install utility packages
3: Option to install additional script (/data/script)
4: Install NFS
5: Option to add VPN
6: Add Spotify and Signal repositories and download some other software
7: Copy wallpaper
8: Copy Dash to Panel settings and leave reminders to install extensions in log
9: Leave log file for default user in ~/ddh-log.txt


Usage
=========================================================
This script is ment to be executed after the reboot following the installation.
Execute as root

Open terminal in the folder containing install.sh and execute

sudo ./install.sh

You need to allow execution of .sh files as programs


List of other apps downloaded to ~/ or installed
=========================================================
XnView MP
Steam

To install execute 'sudo dpkg -i $package_name' from the ~/ directory

Alternatively you can double click and use Ubuntu Software to install everything


Changelog
=========================================================
0.9 - 21/10/2021
Introduced option to either download or install .deb packages

0.2 - 21/10/2021
Adjusted DDH for use with Ubuntu

0.1 - 21/10/2021
Initial commit - Forked Debian Deployment Helper


Legal information
=========================================================
Ubuntu Deployment Helper comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law. Do whatever you want with this software, you can
drop me a line if it helped or if you have a suggestion.


Contact information
=========================================================
If you would like to get in touch, please visit <codedoneright.eu> and navigate
to Contact tab to leave a message.
