#!/bin/bash

echo "Scrip run on Network node"
echo "Enter VIP:"
read VIP


## With Neutron ##

echo "Replate into file neutron.conf"

sudo cp /etc/neutron/neutron.conf /etc/neutron/neutron.conf.bka

sudo sed -i "s/10.10.10.11:/$VIP:/g" /etc/neutron/neutron.conf

sudo sed -i "s/rabbit_hosts = 10.10.10.11/rabbit_hosts = 10.10.10.11,10.10.10.12,10.10.10.13/g" \
/etc/neutron/neutron.conf

####

echo "Check when we have changed!"
echo "File neutron.conf"
diff /etc/neutron/neutron.conf /etc/neutron/neutron.conf.bka
