
#!/bin/bash
#sweeb

echo " "
echo 'Make sure to set scrollback on the terminal to infinity to go correct any errors \n '
echo 'This is going to take a while and probably screw some stuff up \n '
echo "Enjoy \n"

#wget
#wget -mk -w 20 http://www.example.com/ ## This mirrors a seclected site
#wget --mirror --convert-links exampledomain.com
wget http://crunchbang.org/forums/viewtopic.php?id=24722
wget http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.3.3.tar.bz2
wget https://github.com/jedisct1/libsodium/releases/download/0.4.5/libsodium-0.4.5.tar.gz
wget http://media.steampowered.com/client/installer/steam.deb

#Repos
echo 'Adding repos'
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:gnome3-team/gnome3-next
sudo add-apt-repository -y ppa:gnome3-team/gnome3-staging
sudo add-apt-repository -y ppa:fossfreedom/byzanz

#Update
sudo apt-get -y update

#Installing software
sudo apt-get install firefox vrms gimp wine1.7 winetricks scrot htop figlet jp2a toilet ranger xfburn cmus build-essential libx11-dev arandr libxinerama-dev sharutils suckless-tools geany comix feh bum mencoder ffmpeg mplayer rar gnome-tweak-tool git devscripts equivs lxappearance ipkungfu snort rkhunter chkrootkit tiger clamav pwgen p7zip secure-delete lua5.2 youtube-dl pythoncard-tools gnome-shell gnome-shell-extensions nwipe gnupg scrotwm extundelete wipe scrub gddrescue foremost aircrack-ng wifite reaver xprobe rats hydra-gtk  hashalot whois  pyrenamer portsentry netdiag rtgui rtorrent mat pekwm wmii herbstluftwm xmobar sleuthkit autopsy vim vim-scripts bleachbit tree byzanz terminator emacs24 inkscape cowpatty

#update and upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

#git
git clone https://github.com/mpv-player/mpv-build.git
git clone https://github.com/hdni/Phosphene
git clone https://github.com/NitruxSA/flattr-icons.git
#git clone https://github.com/jedisct1/libsodium
#git clone https://github.com/andrew18/df-lnp-installer.git


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
sudo apt-get purge -m libreoffice* totem cheese evolution gedit gnome-mahjongg gnome-mines empathy software-center software-center libreoffice rhythmbox gnome-contacts brasero simple-scan aisleriot zeitgeist zeitgeist-core zeitgeist-datahub gnome-sudoku

sudo apt-get -f install

#general stuff
sudo apt-get -y clean
sudo freshclam
sudo rkhunter --propupd
#sudo tiger
sudo rkhunter -c --sk

#install icons and themes
cd
sudo mv Phosphene /usr/share/themes
sudo mv /usr/share/themes/Adwaita/gtk-2.0 /usr/themes/Phosphene
sudo mv flattr-icons /usr/share/icons
cd

#mpv
#For muh chinese cartoons
cd mpv-build
sudo ./update
sudo mk-build-deps -s sudo -ir
sudo make
sudo make install
cd

#libsodium
tar xzf libsodium-0.4.5/
cd libsodium-0.4.5/
./configure
make && make check && make install
cd

#dnscrypt
tar xzf dnscrypt-proxy-1.3.3
cd dnscrypt-proxy-1.3.3/
./configure && make -j2
sudo make install
cd

#Final upgrade/update
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -f install
sudo apt-get -f install
sudo rm -r Templates
sudo rm -r Public
sudo apt-get -y autoremove

#Muh dorf fort
#need to test out the git repo first
#cd /gitrepo
#./df-lnp-installer.sh

sh hosts.sh

#to-do list
###########

#youtube blocklist http://userscripts.org/scripts/show/156278
#PewDiePie,TobyGames,SmoshGames,Apple,DSPGaming,PandaLeeGames,GirlGoneGamer,darksydephil,Machinima,CinnamonToastKen,CutiePieMarzia,SeaNanners,TheSyndicateProject,smosh,THEKINGOFHATEVLOGS,danisnotonfire,CaptainSparklez,SkyDoesMinecraft,BlueXephos,Yogscastlalna,sssniperwolf,MinnesotaBurns,WhiteBoy7thst,Whiteboy7thst2,CAT7thst,i7thst,UberHaxorNova,speedyw03,nerimon
#it might be possible to automate this i think

#learn how to use dnscrypt

#install muh dwarves via script
#will do next

#put hosts.sh on github then wget it and run it via the script

#look into chattr +i errors for dns crypt

#port to fedora
#su nano /etc/yum.repos.d # add repo cli code

#Service Heaven (Karei, Turtle.Fish.Paint
#page 42
#oppai baka

#####################################################################
#nwipe - Utility to securely erase disks
#gnupg - GNU privacy guard - a free PGP replacement
#scrotwm - another wm
#extundelete - file recovery
#wipe - erase files
#scrub - erase files
#gddrescue - file recovery 
#foremost - forensic program to recover lost files
#aircrack-ng
#wifite - Python script to automate wireless auditing using aircrack-ng tools
#reaver - brute force attack tool against Wifi Protected Setup PIN number
#xprobe -  remote os fingerprinting
#rats - Rough Auditing Tool for Security
#hydra-gtk
#hashalot  - Read and hash a passphrase
#renameutils
#portsentry - Portscan detection daemon
#rtgui - Web based front-end for rTorrent
#rtorrent - ncurses BitTorrent client based on LibTorrent from rakshasa
#mat - Metadata anonymisation toolkit
#pekwm - very light window manager
#wmii - lightweight tabbed and tiled X11 window manager, version 3
#herbstluftwm - manual tiling window manager for X11
#xmobar - lightweight status bar for X11 window managers
#bspwm

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

