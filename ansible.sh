#!/bin/bash

cd setup_ubuntu_users

export ANSIBLE_HOST_KEY_CHECKING=false

ansible-playbook playbook.yml || 
ansible-playbook -u bowei playbook.yml

ansible-playbook post.yml || 
ansible-playbook -u bowei post.yml

