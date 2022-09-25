#!/bin/sh

printf 'Do you want to install ddclient (y/n)? '
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    sudo apt install libdata-validate-ip-perl

    curl -Ss -L https://github.com/ddclient/ddclient/archive/refs/tags/v3.9.1.tar.gz -o ddclient-3.9.1.tar.gz 
    tar -xzvf ddclient-3.9.1.tar.gz 
    cd ddclient-3.9.1
    sudo mkdir /etc/ddclient /var/cache/ddclient
    sudo cp ddclient /usr/local/sbin
    sudo cp sample-etc_ddclient.conf /etc/ddclient/ddclient.conf
    sudo cp $ZSH_DOTFILES/ddclient/sample-etc_systemd.service /etc/systemd/system/ddclient.service

    echo "Now edit:"
    echo "/etc/ddclient/ddclient.conf"

    echo "After the edit run:"
    echo "sudo systemctl enable ddclient.service"

fi

