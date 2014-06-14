#!/bin/bash
#sweeb~

#wget
#wget -mk -w 20 http://www.example.com/ ## This mirrors a seclected site
#wget --mirror --convert-links exampledomain.com
http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.4.0.tar.gz
https://download.libsodium.org/libsodium/releases/libsodium-0.5.0.tar.gz
wget http://media.steampowered.com/client/installer/steam.deb


#Repos
echo 'Adding repos'
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository ppa:webupd8team/popcorntime


#Update
sudo apt-get -y update

#Installing software
sudo apt-get install -y firefox pv vrms wine1.7 winetricks scrot htop ranger arandr geany comix feh bum mplayer rar git gtk-chtheme ipkungfu pwgen p7zip-full secure-delete youtube-dl nwipe wipe i3 scrub hashalot whois pyrenamer vim vim-scripts cmake vim-addon-manager vim-gtk audacity gufw synaptic

#various dependencies
sudo apt-get install -y build-essential autoconf  libx11-dev libxinerama-dev sharutils suckless-tools ffmpeg devscripts equivs libimlib2-dev libquvi-dev libquvi-scripts yasm libpng3 freetype* libgif4 libtiff4 libjpeg62 libxext-dev lua5.2 Lua-lgi pythoncard-tools default-jre libsdl1.2debian libsdl-image1.2 libsdl-ttf2.0-0 libopenal1 mercurial libqt4-dev qt4-qmake wget coreutils tar unzip unrar make g++ gcc patch xterm sed python gtk2-engines-blueheart gtk2-engines-equinox gtk2-engines-moblin gtk2-engines-nodoka gtk2-engines-oxygen gtk2-engines-qtcurve gtk2-engines-wonderland gtk3-engines-oxygen gtk3-engines-unico gtk3-engines-xfce libcairo2-dev libpango1.0-dev libglib2.0-dev libimlib2-dev libxinerama-dev libx11-dev libxdamage-dev libxcomposite-dev libxrender-dev libxrandr-dev libass-dev libavutil-dev libavcodec-dev libavformat-dev libswscale-dev libncurses5-dev

#update and upgrade
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -f

#git
#git clone https://github.com/andrew18/df-lnp-installer.git
git clone https://github.com/hdni/Phosphene
git clone https://github.com/NitruxSA/flattr-icons.git
git clone https://github.com/xyl0n/iris-light
git clone https://github.com/myimouto/myimouto
sudo dpkg -i deadbeef-static_0.6.0-2_i386.deb
sudo dpkg -i steam.deb

#update the newly installed .debs
sudo apt-get -y update
sudo apt-get -y upgrade

#if on vanilla ubuntu uncomment this
#sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video

sudo apt-get -f install 

#Remove bloat
#echo 'bloat removal, May brake some stuff I think'
#Continually changing + adding different DEs
sudo apt-get remove -m libreoffice* totem cheese evolution gedit gnome-mahjongg gnome-mines empathy software-center software-center libreoffice brasero simple-scan aisleriot zeitgeist zeitgeist-core zeitgeist-datahub gnome-sudoku unity unity-common unity-services unity-lens-\* unity-scope-\* unity-webapps-\* gnome-control-center-unity hud libunity-core-6\* libunity-misc4 libunity-webapps\* appmenu-gtk appmenu-gtk3 appmenu-qt\* overlay-scrollbar\* activity-log-manager-control-center firefox-globalmenu thunderbird-globalmenu libufe-xidgetter0 xul-ext-unity xul-ext-webaccounts webaccounts-extension-common xul-ext-websites-integration gnome-control-center gnome-session

sudo apt-get -f install
sudo apt-get autoremove

#install icons and themes
cd
sudo mv Phosphene/ /usr/share/themes
sudo mv /usr/share/themes/Adwaita/gtk-2.0 /usr/share/themes/Phosphene/
sudo mv flattr-icons/ /usr/share/icons
cd

#libsodium
tar xzf libsodium-0.4.5.tar.gz
cd libsodium-0.4.5/
./configure
make && make check && make install
cd

#dnscrypt
tar -jxvf dnscrypt-proxy-1.3.3.tar.bz2 
cd dnscrypt-proxy-1.3.3/
./configure && make -j2
sudo make install
cd

#Final upgrade/update
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -f install
sudo apt-get -y autoremove

rm steam.deb
sudo rm -r Templates
sudo rm -r Public

#general stuff
#sudo tiger
sudo apt-get -y clean
sudo freshclam
sudo rkhunter --propupd
sudo rkhunter -c --sk

#to-do list
###########

#youtube blocklist http://userscripts.org/scripts/show/156278
#PewDiePie,TobyGames,SmoshGames,Apple,DSPGaming,PandaLeeGames,GirlGoneGamer,darksydephil,Machinima,CinnamonToastKen,CutiePieMarzia,SeaNanners,TheSyndicateProject,smosh,THEKINGOFHATEVLOGS,danisnotonfire,CaptainSparklez,SkyDoesMinecraft,BlueXephos,Yogscastlalna,sssniperwolf,MinnesotaBurns,WhiteBoy7thst,Whiteboy7thst2,CAT7thst,i7thst,UberHaxorNova,speedyw03,nerimon
#it might be possible to automate this i think
#
#echo "ls -l" | at midnight
#issue command at certain time
#
#
#lsof -P -i -n
#shows all software using internet
#
#sudo dd if=/dev/mem | cat | strings
#shows all info stored in ram in plaintext
#
#find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate
#Find Duplicate Files (based on size first, then MD5 hash) 
#
#ifconfig | convert label:@- ip.png
#puts command result into an image
#
#wget --random-wait -r -p -e robots=off -U mozilla http://www.example.com
#mirror a site
#
#port to fedora/debian
#su nano /etc/yum.repos.d # add repo cli code
#
#Service Heaven (Karei, Turtle.Fish.Paint
#page 42
