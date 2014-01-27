#!/bin/bash
#sweeb~

echo " "
echo 'Make sure to set scrollback on the terminal to infinity to go correct any errors \n '
echo 'This is going to take a while and probably screw some stuff up \n '
echo "Enjoy \n"
echo "Insert Ganymade to copy some needed files"

read -p "What is your username?
" user ;

#wget
#wget -mk -w 20 http://www.example.com/ ## This mirrors a seclected site
#wget --mirror --convert-links exampledomain.com
wget http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.3.3.tar.bz2
wget https://github.com/jedisct1/libsodium/releases/download/0.4.5/libsodium-0.4.5.tar.gz
wget http://media.steampowered.com/client/installer/steam.deb
wget https://github.com/Lokaltog/powerline-fonts/raw/master/AnonymousPro/Anonymice%20Powerline.ttf
#Repos
echo 'Adding repos'
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:gnome3-team/gnome3-next
sudo add-apt-repository -y ppa:gnome3-team/gnome3-staging
sudo add-apt-repository -y ppa:fossfreedom/byzanz
sudo add-apt-repository -y ppa:kernel-ppa/ppa
sudo add-apt-repository -y ppa:nilarimogard/webupd8

#Update
sudo apt-get -y update

#Installing software
sudo apt-get install -y firefox pv autoconf rxvt-unicode xbindkeys vrms gimp wine1.7 winetricks scrot htop ranger arandr geany comix feh bum mencoder ffmpeg mplayer rar gnome-tweak-tool git gtk-chtheme ipkungfu pwgen p7zip-full secure-delete youtube-dl gnome-shell gnome-shell-extensions nwipe wipe i3 scrub hashalot whois pyrenamer pekwm xmobar vim vim-scripts tree byzanz cmake vim-addon-manager vim-gtk audacity gufw winff xfce4-mixer synaptic

#various dependencies
sudo apt-get install -y build-essential libx11-dev libxinerama-dev sharutils suckless-tools devscripts equivs libimlib2-dev libquvi-dev libquvi-scripts yasm libpng3 freetype* libgif4 libtiff4 libjpeg62 libxext-dev lua5.2 Lua-lgi pythoncard-tools default-jre libsdl1.2debian libsdl-image1.2 libsdl-ttf2.0-0 libopenal1 mercurial libqt4-dev qt4-qmake wget coreutils tar unzip unrar make g++ gcc patch xterm sed python gtk2-engines-blueheart gtk2-engines-equinox gtk2-engines-moblin gtk2-engines-nodoka gtk2-engines-oxygen gtk2-engines-qtcurve gtk2-engines-wonderland gtk3-engines-oxygen gtk3-engines-unico gtk3-engines-xfce libcairo2-dev libpango1.0-dev libglib2.0-dev libimlib2-dev libxinerama-dev libx11-dev libxdamage-dev libxcomposite-dev libxrender-dev libxrandr-dev libass-dev libavutil-dev libavcodec-dev libavformat-dev libswscale-dev libncurses5-dev

#update and upgrade
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -f

#git
#git clone https://github.com/andrew18/df-lnp-installer.git
git clone https://github.com/mpv-player/mpv
git clone https://github.com/hdni/Phosphene
git clone https://github.com/NitruxSA/flattr-icons.git
git clone https://github.com/jedisct1/libsodium
git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
git clone https://github.com/fish-shell/fish-shell
git clone https://github.com/milkbikis/powerline-shell
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
sudo apt-get remove -m libreoffice* totem cheese evolution gedit gnome-mahjongg gnome-mines empathy software-center software-center libreoffice rhythmbox brasero simple-scan aisleriot zeitgeist zeitgeist-core zeitgeist-datahub gnome-sudoku unity unity-common unity-services unity-lens-\* unity-scope-\* unity-webapps-\* gnome-control-center-unity hud libunity-core-6\* libunity-misc4 libunity-webapps\* appmenu-gtk appmenu-gtk3 appmenu-qt\* overlay-scrollbar\* activity-log-manager-control-center firefox-globalmenu thunderbird-globalmenu libufe-xidgetter0 xul-ext-unity xul-ext-webaccounts webaccounts-extension-common xul-ext-websites-integration gnome-control-center gnome-session

sudo apt-get -f install
sudo apt-get autoremove

#install icons and themes
cd
sudo mv Phosphene/ /usr/share/themes
sudo mv /usr/share/themes/Adwaita/gtk-2.0 /usr/share/themes/Phosphene/
sudo mv flattr-icons/ /usr/share/icons
cd

#compile ffmpeg to satisfy dependcies for mpv
cd ffmpeg/
sudo ./configure
sudo make
sudo make install
cd

#building from source
#For muh chinese cartoons
cd mpv/
python bootstrap.py
./waf configure
./waf build
sudo ./waf install
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

#fishshell
cd fish-shell/
autoconf
./configure
make
sudo make install
cd

#powerline shell
#add this to bashrc start
#function _update_ps1() {
#       export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
#    }
#
#    export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

cd powerline-shell/
./install.py
cd
ln -s ~/powerline-shell/powerline-shell.py ~/powerline-shell.py

mkdir .fonts
mv Anonymice\ Powerline.ttf .fonts/

#Final upgrade/update
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -f install
sudo apt-get -y autoremove

#Muh dorf fort
#need to test out the git repo first
#cd /gitrepo
#./df-lnp-installer.sh

sh hosts.sh
rm dnscrypt-proxy-1.3.3.tar.bz2
rm libsodium-0.4.5.tar.gz
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
#wget -qO - http://infiltrated.net/blacklisted|awk '!/#|[a-z]/&&/./{print "iptables -A INPUT -s "$1" -j DROP"}' |sh
#update iptables
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
#mtr google.com
# better than traceroute
#port to fedora/debian
#su nano /etc/yum.repos.d # add repo cli code
#
#Service Heaven (Karei, Turtle.Fish.Paint
#page 42
#oppai baka


sudo echo '# =========================================================================
# $Id: ipkungfu.conf 57 2005-11-02 17:04:20Z s0undt3ch $
# =========================================================================

# Please read the README and FAQ for more information

# Some distros (most notably Redhat) dont have
# everything we need in $PATH so we specify it here.
# Make sure modprobe, iptables, and route are here,
# as well as ordinary items such as echo and grep.
# Default is as shown in the example below.
#PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin

# Set the path to ipkungfus runtime error log.
# Default: /var/log/ipkungfu.log
#IPKUNGFU_LOG=

# Your external interface
# This is the one that connects to the internet.
# Ipkungfu will detect this if you dont specify.
#EXT_NET="eth0"
#EXT_NET="eth1"
#EXT_NET="ppp0"

# Your internal interfaces, if any.  If you have more
# than 1 internal interface, separate them with
# spaces.  If you only have one interface, put "lo"
# here. Default is auto-detected.
#INT_NET="eth0"
#INT_NET="eth1"
#INT_NET="lo"

# IP Range of your internal network.  Use "127.0.0.1"
# for a standalone machine.  Default is a reasonable
# guess. Separate multiple ranges with spaces.
LOCAL_NET="192.168.1.0/255.255.255.0"

# Set this to 0 for a standalone machine, or 1 for
# a gateway device to share an Internet connection.
# Default is 1.
GATEWAY=0

# TCP ports you want to allow for incoming traffic
# Dont add ports here that you intend to forward.
# This should be a list of tcp ports that have
# servers listening on them on THIS machine,
# separated by spaces. You can add port ranges
# delimited by hyphens, such as "20-22". Default 
# is none.
#ALLOWED_TCP_IN="21 22"

# UDP ports to allow for incoming traffic
# See the comments above for ALLOWED_TCP_IN
#ALLOWED_UDP_IN=""

# Temporarily block future connection attempts from an
# IP that hits these ports (If module is present)
# Hits to these ports will be logged as "BADGUY" hits
# regardless of log.conf settings.
FORBIDDEN_PORTS="135 137 139"

# Drop all ping packets?
# Set to 1 for yes, 0 for no. Default is no.
BLOCK_PINGS=1

# Possible values here are "DROP", "REJECT", or "MIRROR"
#
# "DROP" means your computer will not respond at all. "Stealth mode"
#
# "REJECT" means your computer will respond with a
# message that the packet was rejected.
#
# "MIRROR", if your kernel supports it, will swap the source and
#   destination IP addresses, and send the offending packet back
#   where it came from.  USE WITH EXTREME CAUTION! Only use this if you fully
#   understand the consequences.
#
# The safest option, and the default in each case,,  is "DROP". Dont change 
# unless you fully understand this.


# What to do with 'probably malicious' packets
#SUSPECT="REJECT" 
SUSPECT="DROP"

# What to do with obviously invalid traffic
# This is also the action for FORBIDDEN_PORTS
#KNOWN_BAD="REJECT"
KNOWN_BAD="DROP"

# What to do with port scans
#PORT_SCAN="REJECT"
PORT_SCAN="DROP"

# How should ipkungfu determine your IP address? The default
# answer, "NONE", will cause ipkungfu to not use the few
# features that require it to know your external IP address.
# This option is good for dialup users who run ipkungfu on
# bootup, since dialup users rarely use the features that
# require this, and the IP address for a dialup connection
# generally isnt known at bootup.  "AUTO" will cause
# ipkungfu to automatically determine the IP address of
# $EXT_NET when it is started.  If you have a static IP
# address you can simply enter your IP address here.
# If you do port forwarding and your ISP changes your IP
# address, choose NONE here, or your port forwarding
# will break when your IP address changes. Default is
# "NONE".
#GET_IP="NONE"
#GET_IP="AUTO"
#GET_IP="128.238.244.16"

# If the target for identd (113/tcp) is DROP, it can take
# a long time to connect to some IRC servers. Set this to
# 1 to speed up these connections with a negligible cost
# to security.  Identd probes will be rejected with the
# 'reject-with-tcp-reset' option to close the connection
# gracefully. If you want to actually allow ident probes,
# and you're running an identd, and you've allowed port
# 113 in ALLOWED_TCP_IN, set this to 0. Default is 0.
#DONT_DROP_IDENTD=0

# Set this to 0 if youre running ipkungfu on a machine
# inside your LAN.  This will cause private IP addresses
# coming in on $EXT_NET to be identified as a spoof,
# which would be inaccurate on intra-LAN traffic
# This will cause private IP addresses coming in on 
# $EXT_NET to be identified as a spoof. Default is 1.
#DISALLOW_PRIVATE=1

# For reasons unknown to me, ipkungfu sometimes causes
# kernel panics when run at init time. This is my
# attempt to work around that.  Ipkungfu will wait
# the specified number of seconds before starting, to
# let userspace/kernel traffic catch up before executing.
# Default is 0.
#WAIT_SECONDS=5

# This option, if enabled, will cause ipkungfu to set
# the default policy on all builtin chains in the filter
# table to ACCEPT in the event of a failure.  This is 
# intended for remote administrators who may be locked 
# out of the firewall if ipkungfu fails.  A warning to 
# this effect will be echoed so that the situation can be
# rectified quickly.  This is the same as running
# ipkungfu with --failsafe.  Default is 0.
#FAILSAFE=0

# Configurable list of kernel modules to load at runtime.
# If no list is provided, the default and needed ones,
# ip_nat_irc, ip_conntrack_ftp ip_nat_ftp ip_conntrack_irc,
# will still be loaded.
#MODULES_LIST="' > /etc/ipkungfu/ipkungfu.conf

sudo echo '# Defaults for ipkungfu initscript
# sourced by /etc/init.d/ipkungfu
# installed at /etc/default/ipkungfu by the maintainer scripts

#
# This is a POSIX shell fragment
#

# Additional options that are passed to the Daemon.
DAEMON_OPTS=""
IPKFSTART=1' > /etc/default/ipkungfu

sudo echo '#
# /etc/sysctl.conf - Configuration file for setting system variables
# See /etc/sysctl.d/ for additional system variables
# See sysctl.conf (5) for information.
#

#kernel.domainname = example.com

# Uncomment the following to stop low-level messages on console
#kernel.printk = 3 4 1 3

##############################################################3
# Functions previously found in netbase
#

# Uncomment the next two lines to enable Spoof protection (reverse-path filter)
# Turn on Source Address Verification in all interfaces to
# prevent some spoofing attacks
#net.ipv4.conf.default.rp_filter=1
#net.ipv4.conf.all.rp_filter=1

# Uncomment the next line to enable TCP/IP SYN cookies
# See http://lwn.net/Articles/277146/
# Note: This may impact IPv6 TCP sessions too
#net.ipv4.tcp_syncookies=1

# Uncomment the next line to enable packet forwarding for IPv4
#net.ipv4.ip_forward=1

# Uncomment the next line to enable packet forwarding for IPv6
#  Enabling this option disables Stateless Address Autoconfiguration
#  based on Router Advertisements for this host
#net.ipv6.conf.all.forwarding=1


###################################################################
# Additional settings - these settings can improve the network
# security of the host and prevent against some network attacks
# including spoofing attacks and man in the middle attacks through
# redirection. Some network environments, however, require that these
# settings are disabled so review and enable them as needed.
#
# Do not accept ICMP redirects (prevent MITM attacks)
net.ipv4.conf.all.accept_redirects = 0
#et.ipv6.conf.all.accept_redirects = 0
# _or_
# Accept ICMP redirects only for gateways listed in our default
# gateway list (enabled by default)
# net.ipv4.conf.all.secure_redirects = 1
#
# Do not send ICMP redirects (we are not a router)
net.ipv4.conf.all.send_redirects = 0
#
# Do not accept IP source route packets (we are not a router)
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0
#
# Log Martian Packets
net.ipv4.conf.all.log_martians = 1
#' > /etc/sysctl.conf
sudo sysctl -p



#sudo apt-get autoremove resolvconf
#sudo echo 'nameserver 84.22.106.30' > /etc/resolv.conf
#sudo chattr +i /etc/resolv.conf

echo "The script is done,Enjoy" | pv -qL 10
