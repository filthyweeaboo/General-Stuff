#!/bin/bash

echo "report any mistakes to my github *filthyweeaboo*"
echo "be gentle i'm new to bash and scripting in general"
echo "run this in the home directory please or the git clones will be in some obscure folder and the script will fail"
while true; do
    read -p "Do you want to continue (Y/N)?" answer
    case $answer in
        [Yy]* ) echo "Ok"; break;;
        [Nn]* ) echo "Fine"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#read -p "Run this script in home directory please"


#become superuser
#echo Become root please
#sudo -s


#This will install all of my most used software	

echo Adding repos


#Repos
sudo add-apt-repository -y ppa:kubuntu-ppa/backports
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:indicator-multiload/stable-daily
sudo add-apt-repository -y ppa:finalterm/daily
sudo add-apt-repository -y ppa:snwh/moka-icon-theme-daily


#Updates
sudo apt-get -y update
sudo apt-get -y upgrade


#Installing software
sudo apt-get install -y -m firefox sl toilet ranger cmus krita deluge build-essential libx11-dev libxinerama-dev sharutils suckless-tools geany comix espeak feh bum preload indicator-multiload mencoder ffmpeg mplayer rar gnome-tweak-tool git devscripts equivs lxappearance moka-icon-theme secure-delete ipkungfu snort rkhunter chkrootkit tiger clamav pwgen cmatrix fortune-mod oneko funny-manpages curl p7zip


#finalterm is propietery and alpha so don't install yet until dev changes or liscence changes

#wget shit
#wget -mk -w 20 http://www.example.com/
wget http://media.steampowered.com/client/installer/steam.deb


#git
git clone https://github.com/mpv-player/mpv-build.git
git clone https://github.com/hdni/Phosphene


#debs
sudo dpkg -i steam.deb


#if on vanilla ubuntu uncomment this
#sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video


#Remove shit software (bloat)
echo "don't fuck with the removal part of the script as it will screw some packages up and break some shit"
#Continually changing + adding different DEs
#sudo apt-get remove --purge --ignore-missing libreoffice* totem gbrainy aisleriot gbrainy gnome-sudoku gnomine libgme0 mahjongg bogofilter empathy thunderbird remmina gwibber tomboy avahi-daemon whoopsie samba modemmanager rhythmbox activity-log-manager-common python-zeitgeist zeitgeist-core deja-dup pidgin apport


#Clean up stuff + security shit
sudo apt-get -y clean
sudo apt-get -y autoremove
sudo freshclam
sudo rkhunter --update
sudo rkhunter --propupd
sudo chkrootkit


#general stuff
#gksu gedit /etc/default/apport
#sudo service apport start force_start=1 enabled=1
#change to =0
#youtube blocklist http://userscripts.org/scripts/show/156278
#PewDiePie,TobyGames,SmoshGames,Apple,DSPGaming,PandaLeeGames,GirlGoneGamer,darksydephil,Machinima,CinnamonToastKen,CutiePieMarzia,SeaNanners,TheSyndicateProject,smosh,THEKINGOFHATEVLOGS,danisnotonfire,CaptainSparklez,SkyDoesMinecraft,BlueXephos,Yogscastlalna,sssniperwolf,MinnesotaBurns,WhiteBoy7thst,Whiteboy7thst2,CAT7thst,i7thst,UberHaxorNova,speedyw03,nerimon


cd mpv-build
./update
mk-build-deps -s sudo -ir
make
sudo make install && mpv
cd
echo "mpv is now installed"

#Upgrade
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

