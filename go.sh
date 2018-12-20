#!/bin/bash

set -eu

sudo apt update
sudo apt upgrade

which ansible

if [ ! $? -eq 0 ]; then
    sudo add-apt-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible
fi;

ansible-playbook -K -i "localhost," -c local workstation.yml $@
