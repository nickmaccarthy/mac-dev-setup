#!/bin/bash
# We need to get pip installed first
sudo /usr/bin/easy_install pip
# Now we can install Ansible
sudo pip install 'ansible>=2.3.0'
# Install our ansible galaxy roles
sudo ansible-galaxy install -r requirements.yml
# Now we can run ansible
ansible-playbook playbook.yml -vv --ask-sudo-pass
