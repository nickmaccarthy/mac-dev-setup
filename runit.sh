#!/bin/bash
# We need to get pip installed first
if ! [ -x "$(command -v pip)" ]; then
  echo 'Pip is not installed, installing python pip' >&2
  sudo /usr/bin/easy_install pip
else
  echo "PIP is already installed... moving on..."
fi

# Now we can install Ansible
if ! [ -x "$(command -v ansible-playbook)" ]; then
  echo 'Ansible is not installed, installing Ansible' >&2
  pip install 'ansible>=2.3.0'
else
  echo "Ansible is already installed... moving on..."
fi
# Install our ansible galaxy roles
echo "Installing role requirements for Ansible"
ansible-galaxy install -r requirements.yml
# Now we can run ansible
echo "Running Ansible playbook..."
ansible-playbook playbook.yml -vv --ask-sudo-pass
