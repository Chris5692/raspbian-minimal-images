#!bin/bash

# Packages to be removed
# rsync , avahi-daemon


# Removing unncessary packages 
sudo apt remove --purge x11* midori* lxde* python* alsa* bluez* vim* -y ;
sudo apt remove --purge $(sudo apt search xorg)

sudo apt remove --purge $(sudo apt search * | grep installed | awk '{print $1}' | sed 's@/[^ ]*@@g') ; sudo apt autoremove -y ; 

sudo apt remove --purge $(sudo dpkg --get-selections | grep -v "deinstall" | grep python | sed s/install//) ; sudo apt autoremove -y 

# Removing the test code
sudo rm -rf /opt ; 

# Removing apt cache
sudo rm -rf /var/lib/apt/lists/* ; sudo rm -rf /var/cache/apt/* ;

# Removing devlopment packages
sudo apt remove --purge $(sudo dpkg --get-selections | grep "\-dev" | sed s/install//) ; 
