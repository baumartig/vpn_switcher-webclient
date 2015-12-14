#!/usr/bin/env bash

echo "Start Provisioning"
if dpkg --get-selections | grep -q "^ansible[[:space:]]*install$" >/dev/null; then
    echo "Ansible bereits installiert"
else
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible
fi

echo "Starting ansible playbook"
ansible-playbook /vagrant/ansible/playbook.yml --connection=local