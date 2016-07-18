#!/bin/bash

# http://www.socsci.uci.edu/~jstern/uci_vpn_ubuntu/ubuntu-openconnect-uci-instructions.html

VPNGRP=Okta
VPNUSER=aleite
VPNURL=https://chivpn.thoughtworks.com
VPNSCRIPT=/usr/share/vpnc-scripts/vpnc-script

sudo openvpn --mktun --dev tun1 && \
sudo ifconfig tun1 up && \
sudo /usr/sbin/openconnect -s $VPNSCRIPT $VPNURL --user=$VPNUSER --authgroup=$VPNGRP --interface=tun1
sudo ifconfig tun1 down
