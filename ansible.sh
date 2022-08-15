#!/bin/bash

cd setup_ubuntu_users

ansible-playbook playbook.yml || 
ansible-playbook -u bowei playbook.yml

