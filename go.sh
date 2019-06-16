#!/bin/bash

set -u

version="${1:-linux}"

if [[ `uname` == 'Darwin' ]]; then
    which ansible

    if [ ! $? -eq 0 ]; then
        set -e

        brew install ansible
    fi;

elif [[ `uname` == 'Linux' ]]; then
    sudo apt update
    sudo apt upgrade

    which ansible

    if [ ! $? -eq 0 ]; then
        set -e

        sudo add-apt-repository ppa:ansible/ansible
        sudo apt-get update
        sudo apt-get install -y ansible
    fi;
fi;

set -x

ansible-playbook -K -i "localhost," -c local ${version}.yaml "${@:2}"
