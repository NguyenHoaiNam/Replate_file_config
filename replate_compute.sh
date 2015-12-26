#!/bin/bash

echo "Scrips run on COMPUTE node"
sleep 5
echo "Enter VIP:"
read VIP

## With Neutron

echo "Replate into file neutron.conf"
sleep 3

sudo cp /etc/neutron/neutron.conf /etc/neutron/neutron.conf.bka

sudo sed -i "s/10.10.10.11:/$VIP:/g" /etc/neutron/neutron.conf

sudo sed -i "s/rabbit_hosts = 10.10.10.11/rabbit_hosts = 10.10.10.11,10.10.10.12,10.10.10.13/g" \
/etc/neutron/neutron.conf

## With Nova

echo "Replate into file nova.conf"
sleep 3

sudo cp /etc/nova/nova.conf /etc/nova/nova.conf.bka

sudo sed -i "s/10.10.10.11:/$VIP:/g"  /etc/nova/nova.conf

sudo sed -i "s/rabbit_hosts = 10.10.10.11/rabbit_hosts = 10.10.10.11,10.10.10.12,10.10.10.13/g" \
/etc/nova/nova.conf

####

echo "Check again when we have changed !!!"
echo "File neutron.conf"
diff /etc/neutron/neutron.conf /etc/neutron/neutron.conf.bka
echo "File nova.conf"
diff /etc/nova/nova.conf /etc/nova/nova.conf.bka
