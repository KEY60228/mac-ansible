#!/bin/bash

ANSIBLE_PATH=~/ansible

## ansible
cd ${ANSIBLE_PATH}
ansible-playbook -i inventory/localhost localhost.yml
