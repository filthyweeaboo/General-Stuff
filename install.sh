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
wget http://skylink.dl.sourceforge.net/project/menumaker/MenuMaker/0.99.7/menumaker-0.99.7.tar.gz
wget http://crunchbang.org/forums/viewtopic.php?id=24722
wget http://switch.dl.sourceforge.net/project/deadbeef/debian/0.6.0/deadbeef-static_0.6.0-2_i386.deb
wget http://switch.dl.sourceforge.net/project/deadbeef/deadbeef-static_0.6.0-2_i686.tar.bz2
wget https://github.com/Lokaltog/powerline-fonts/raw/master/AnonymousPro/Anonymice%20Powerline.ttf
wget http://dl.dropboxusercontent.com/s/vv0qsrixm3z2hss/Grabber_3.4.1.exe
#Repos
echo 'Adding repos'
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:gnome3-team/gnome3-next
sudo add-apt-repository -y ppa:gnome3-team/gnome3-staging
sudo add-apt-repository -y ppa:fossfreedom/byzanz
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo add-apt-repository -y ppa:kernel-ppa/ppa
sudo add-apt-repository -y ppa:nilarimogard/webupd8

#Update
sudo apt-get -y update

#Installing software
sudo apt-get install -y firefox pv vrms gimp wine1.7 winetricks scrot htop ranger arandr geany comix feh bum mencoder ffmpeg mplayer rar gnome-tweak-tool git gtk-chtheme ipkungfu snort rkhunter chkrootit tiger clamav pwgen p7zip-full secure-delete youtube-dl gnome-shell gnome-shell-extensions nwipe wipe scrotwm scrub hashalot whois pyrenamer portsentry pekwm xmobar vim vim-scripts bleachbit tree byzanz emacs24 inkscape cmake vim-addon-manager vim-gtk simplescreenrecorder audacity gufw winff openbox obconf openbox-themes vlc browser-plugin-vlc xfce4-mixer synaptic thunar

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
git clone git://github.com/xorg62/wmfs.git
git clone https://github.com/nojhan/liquidprompt.git
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
./waf configure
./waf build
sudo ./waf install

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

#menumaker
tar xzf menuemaker-0.99.7.tar.gz
cd menumaker-0.99.7/
./configure
make
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
sudo apt-get -f install
sudo apt-get -y autoremove

#Muh dorf fort
#need to test out the git repo first
#cd /gitrepo
#./df-lnp-installer.sh

sudo mv iris-light/ /usr/share/themes/
cp /media/$user/GANYMEDE/essentials/hosts.sh /home/$user/
sh hosts.sh
mkdir /home/$user/bin 
cp /media/$user/GANYMEDE/essentials/dorffort.tar.gz /home/$user/bin
cd /home/$user/bin
tar xzf dorffort.tar.gz
rm dorffort.tar.gz
cd
cp /media/$user/GANYMEDE/essentials/DroidSans.otf /home/$user/.fonts/
rm dnscrypt-proxy-1.3.3.tar.bz2
rm libsodium-0.4.5.tar.gz
rm steam.deb
sudo rm -r Templates
sudo rm -r Public
cp /media/$user/GANYMEDE/essentials/deadbeef /home/$user/
cp /media/sweeb/GANYMEDE/essentials/settings.ini /home/$user/.config/gtk-3.0/

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
#don't lose this magnet:?xt=urn:btih:fe07e5640d721dcddb68dfca337fde2433490294&dn=lolisv4&tr=http%3A%2F%2Ftracker.publicbt.com%3A80
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

sudo echo '# PortSentry Configuration
#
# $Id: portsentry.conf.Debian,v 1.6 2001/07/19 21:02:20 agx Exp $
# 
# Original portsentry.conf by Craig H. Rowland <crowland@psionic.com>
# modified for Debian by Guido Guenther <agx@debian.org>
#
# IMPORTANT NOTE: You CAN NOT put spaces between your port arguments.
# 
# The default ports will catch a large number of common probes
#
# All entries must be in quotes.


#######################
# Port Configurations #
#######################
#
#
# Some example port configs for classic and basic Stealth modes
#
# I like to always keep some ports at the low end of the spectrum.
# This will detect a sequential port sweep really quickly and usually
# these ports are not in use (i.e. tcpmux port 1)
#
# ** X-Windows Users **: If you are running X on your box, you need to be sure
# you are not binding PortSentry to port 6000 (or port 2000 for OpenWindows users). 
# Doing so will prevent the X-client from starting properly. 
#
# These port bindings are *ignored* for Advanced Stealth Scan Detection Mode.
#

# Un-comment these if you are really anal:
TCP_PORTS="1,7,9,11,15,70,79,80,109,110,111,119,138,139,143,512,513,514,515,540,635,1080,1524,2000,2001,4000,4001,5742,6000,6001,6667,12345,12346,20034,27665,30303,32771,32772,32773,32774,31337,40421,40425,49724,54320"
UDP_PORTS="1,7,9,66,67,68,69,111,137,138,161,162,474,513,517,518,635,640,641,666,700,2049,31335,27444,34555,32770,32771,32772,32773,32774,31337,54321"
#
# Use these if you just want to be aware:
TCP_PORTS="1,11,15,79,111,119,143,540,635,1080,1524,2000,5742,6667,12345,12346,20034,27665,31337,32771,32772,32773,32774,40421,49724,54320"
UDP_PORTS="1,7,9,69,161,162,513,635,640,641,700,37444,34555,31335,32770,32771,32772,32773,32774,31337,54321"
#
# Use these for just bare-bones
#TCP_PORTS="1,11,15,110,111,143,540,635,1080,1524,2000,12345,12346,20034,32771,32772,32773,32774,49724,54320"
#UDP_PORTS="1,7,9,69,161,162,513,640,700,32770,32771,32772,32773,32774,31337,54321"

###########################################
# Advanced Stealth Scan Detection Options #
###########################################
#
# This is the number of ports you want PortSentry to monitor in Advanced mode.
# Any port *below* this number will be monitored. Right now it watches 
# everything below 1024. 
# 
# On many Linux systems you cannot bind above port 61000. This is because
# these ports are used as part of IP masquerading. I dont recommend you
# bind over this number of ports. Realistically: I DONT RECOMMEND YOU MONITOR 
# OVER 1024 PORTS AS YOUR FALSE ALARM RATE WILL ALMOST CERTAINLY RISE. Youve been
# warned! Dont write me if you have have a problem because Ill only tell
# you to RTFM and dont run above the first 1024 ports.
#
#
ADVANCED_PORTS_TCP="1024"
ADVANCED_PORTS_UDP="1024"
#
# This field tells PortSentry what ports (besides listening daemons) to
# ignore. This is helpful for services like ident that services such 
# as FTP, SMTP, and wrappers look for but you may not run (and probably 
# *shouldnt* IMHO). 
#
# By specifying ports here PortSentry will simply not respond to
# incoming requests, in effect PortSentry treats them as if they are
# actual bound daemons. The default ports are ones reported as 
# problematic false alarms and should probably be left alone for
# all but the most isolated systems/networks.
#
# Default TCP ident and NetBIOS service
ADVANCED_EXCLUDE_TCP="113,139"
# Default UDP route (RIP), NetBIOS, bootp broadcasts.
ADVANCED_EXCLUDE_UDP="520,138,137,67"


######################
# Configuration Files#
######################
#
# Hosts to ignore
IGNORE_FILE="/etc/portsentry/portsentry.ignore"
# Hosts that have been denied (running history)
HISTORY_FILE="/var/lib/portsentry/portsentry.history"
# Hosts that have been denied this session only (temporary until next restart)
BLOCKED_FILE="/var/lib/portsentry/portsentry.blocked"

##############################
# Misc. Configuration Options#
##############################
#
# DNS Name resolution - Setting this to "1" will turn on DNS lookups
# for attacking hosts. Setting it to "0" (or any other value) will shut
# it off.
RESOLVE_HOST = "0"

###################
# Response Options#
###################
# Options to dispose of attacker. Each is an action that will 
# be run if an attack is detected. If you dont want a particular
# option then comment it out and it will be skipped.
#
# The variable $TARGET$ will be substituted with the target attacking
# host when an attack is detected. The variable $PORT$ will be substituted
# with the port that was scanned. 
#
##################
# Ignore Options #
##################
# These options allow you to enable automatic response
# options for UDP/TCP. This is useful if you just want
# warnings for connections, but dont want to react for  
# a particular protocol (i.e. you want to block TCP, but
# not UDP). To prevent a possible Denial of service attack
# against UDP and stealth scan detection for TCP, you may 
# want to disable blocking, but leave the warning enabled. 
# I personally would wait for this to become a problem before
# doing though as most attackers really arent doing this.
# The third option allows you to run just the external command
# in case of a scan to have a pager script or such execute
# but not drop the route. This may be useful for some admins
# who want to block TCP, but only want pager/e-mail warnings
# on UDP, etc.
#
# 
# 0 = Do not block UDP/TCP scans.
# 1 = Block UDP/TCP scans.
# 2 = Run external command only (KILL_RUN_CMD)

BLOCK_UDP="0"
BLOCK_TCP="0"

###################
# Dropping Routes:#
###################
# This command is used to drop the route or add the host into
# a local filter table. 
#
# The gateway (333.444.555.666) should ideally be a dead host on 
# the *local* subnet. On some hosts you can also point this at
# localhost (127.0.0.1) and get the same effect. NOTE THAT
# 333.444.555.66 WILL *NOT* WORK. YOU NEED TO CHANGE IT!!
#
# ALL KILL ROUTE OPTIONS ARE COMMENTED OUT INITIALLY. Make sure you
# uncomment the correct line for your OS. If you OS is not listed
# here and you have a route drop command that works then please
# mail it to me so I can include it. ONLY ONE KILL_ROUTE OPTION
# CAN BE USED AT A TIME SO DONT UNCOMMENT MULTIPLE LINES.
#
# NOTE: The route commands are the least optimal way of blocking
# and do not provide complete protection against UDP attacks and
# will still generate alarms for both UDP and stealth scans. I
# always recommend you use a packet filter because they are made
# for this purpose.
#

# Generic 
#KILL_ROUTE="/sbin/route add $TARGET$ 333.444.555.666"

# Generic Linux 
#KILL_ROUTE="/sbin/route add -host $TARGET$ gw 333.444.555.666"

# Newer versions of Linux support the reject flag now. This 
# is cleaner than the above option.
KILL_ROUTE="/sbin/route add -host $TARGET$ reject"

# Generic BSD (BSDI, OpenBSD, NetBSD, FreeBSD)
#KILL_ROUTE="/sbin/route add $TARGET$ 333.444.555.666"

# Generic Sun 
#KILL_ROUTE="/usr/sbin/route add $TARGET$ 333.444.555.666 1"

# NEXTSTEP
#KILL_ROUTE="/usr/etc/route add $TARGET$ 127.0.0.1 1"

# FreeBSD
#KILL_ROUTE="route add -net $TARGET$ -netmask 255.255.255.255 127.0.0.1 -blackhole"

# Digital UNIX 4.0D (OSF/1 / Compaq Tru64 UNIX)
#KILL_ROUTE="/sbin/route add -host -blackhole $TARGET$ 127.0.0.1"

# Generic HP-UX
#KILL_ROUTE="/usr/sbin/route add net $TARGET$ netmask 255.255.255.0 127.0.0.1"

##
# Using a packet filter is the PREFERRED. The below lines
# work well on many OSs. Remember, you can only uncomment *one*
# KILL_ROUTE option.
##

# ipfwadm support for Linux
#KILL_ROUTE="/sbin/ipfwadm -I -i deny -S $TARGET$ -o"
#
# ipfwadm support for Linux (no logging of denied packets)
#KILL_ROUTE="/sbin/ipfwadm -I -i deny -S $TARGET$"
#
# ipchain support for Linux
#KILL_ROUTE="/sbin/ipchains -I input -s $TARGET$ -j DENY -l"
#
# ipchain support for Linux (no logging of denied packets)
#KILL_ROUTE="/sbin/ipchains -I input -s $TARGET$ -j DENY"
#
# iptables support for Linux
#KILL_ROUTE="/sbin/iptables -I INPUT -s $TARGET$ -j DROP"
#
# iptables support for Linux with limit and LOG support. Logs only
# a limited number of packets to avoid a denial of service attack.
# KILL_ROUTE="/sbin/iptables -I INPUT -s $TARGET$ -j DROP && /sbin/iptables -I INPUT -s $TARGET$ -m limit --limit 3/minute --limit-burst 5 -j LOG --log-level DEBUG --log-prefix 'Portsentry: dropping: '"
#
# For those of you running FreeBSD (and compatible) you can
# use their built in firewalling as well. 
#
#KILL_ROUTE="/sbin/ipfw add 1 deny all from $TARGET$:255.255.255.255 to any"
#
#
# For those running ipfilt (OpenBSD, etc.)
# NOTE THAT YOU NEED TO CHANGE external_interface TO A VALID INTERFACE!!
#
#KILL_ROUTE="/bin/echo 'block in log on external_interface from $TARGET$/32 to any' | /sbin/ipf -f -"


###############
# TCP Wrappers#
###############
# This text will be dropped into the hosts.deny file for wrappers
# to use. There are two formats for TCP wrappers:
#
# Format One: Old Style - The default when extended host processing
# options are not enabled.
#
#KILL_HOSTS_DENY="ALL: $TARGET$"

# Format Two: New Style - The format used when extended option
# processing is enabled. You can drop in extended processing
# options, but be sure you escape all '%' symbols with a backslash
# to prevent problems writing out (i.e. \%c \%h )
#
KILL_HOSTS_DENY="ALL: $TARGET$ : DENY"

###################
# External Command#
###################
# This is a command that is run when a host connects, it can be whatever
# you want it to be (pager, etc.). This command is executed before the 
# route is dropped or after depending on the KILL_RUN_CMD_FIRST option below
#
#
# I NEVER RECOMMEND YOU PUT IN RETALIATORY ACTIONS AGAINST THE HOST SCANNING 
# YOU!
#
# TCP/IP is an *unauthenticated protocol* and people can make scans appear out 
# of thin air. The only time it is reasonably safe (and I *never* think it is 
# reasonable) to run reverse probe scripts is when using the "classic" -tcp mode. 
# This mode requires a full connect and is very hard to spoof.
#
# The KILL_RUN_CMD_FIRST value should be set to "1" to force the command 
# to run *before* the blocking occurs and should be set to "0" to make the 
# command run *after* the blocking has occurred. 
#
#KILL_RUN_CMD_FIRST = "0"
#
#
#KILL_RUN_CMD="/some/path/here/script $TARGET$ $PORT$ $MODE$"
# for examples see /usr/share/doc/portsentry/examples/


#####################
# Scan trigger value#
#####################
# Enter in the number of port connects you will allow before an 
# alarm is given. The default is 0 which will react immediately.
# A value of 1 or 2 will reduce false alarms. Anything higher is 
# probably not necessary. This value must always be specified, but
# generally can be left at 0. 
#
# NOTE: If you are using the advanced detection option you need to
# be careful that you dont make a hair trigger situation. Because
# Advanced mode will react for *any* host connecting to a non-used 
# port below your specified range, you have the opportunity to
# really break things. (i.e someone innocently tries to connect to
# you via SSL [TCP port 443] and you immediately block them). Some
# of you may even want this though. Just be careful.
#
SCAN_TRIGGER="0"

######################
# Port Banner Section#
######################
#
# Enter text in here you want displayed to a person tripping the PortSentry.
# I *dont* recommend taunting the person as this will aggravate them.
# Leave this commented out to disable the feature
#
# Stealth scan detection modes dont use this feature
#
PORT_BANNER="** UNAUTHORIZED ACCESS PROHIBITED *** YOUR CONNECTION ATTEMPT HAS BEEN LOGGED. GO AWAY."

# EOF' > /etc/portsentry/portsentry.conf

#sudo apt-get autoremove resolvconf
#sudo echo 'nameserver 84.22.106.30' > /etc/resolv.conf
#sudo chattr +i /etc/resolv.conf

#source liquidprompt/liquidprompt
echo "The script is done,Enjoy" | pv -qL 10
