#!/bin/bash

### Install RabbitMQ:

sudo apt-get purge rabbitmq-server -y
sudo apt-get install rabbitmq-server -y
sudo service rabbitmq-server stop

# Copy file cooki from controller1 to other controller
# Run on controller1:
# scp /var/lib/rabbitmq/.erlang.cookie root@10.10.10.12:/var/lib/rabbitmq/.erlang.cookie
# scp /var/lib/rabbitmq/.erlang.cookie root@10.10.10.13:/var/lib/rabbitmq/.erlang.cookie
# Then Start rabbit on three nodes:
# sudo service rabbitmq-server start
##
# On node 2,3
# rabbitmqctl stop_app
# rabbitmqctl join_cluster rabbit@controller1
# rabbitmqctl start_app
# rabbitmqctl cluster_status
########
### On node 1, create rabbit user:
# sudo rabbitmqctl add_user stackrabbit abc123
# rabbitmqctl set_permissions openstack ".*" ".*" ".*"
