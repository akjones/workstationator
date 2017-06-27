#!/bin/bash

set -eu

which ansible

if [ ! $? -eq 0 ]; then
    sudo add-apt-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible
fi;

ansible-playbook --ask-sudo-pass -i "localhost," -c local workstation.yml $@
