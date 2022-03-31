#!/bin/bash

ANSIBLE_PATH=~/ansible

## command line toolsとhomebrew、ansibleのインストール
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible

## repositoryのclone
git clone -b template https://github.com/KEY60228/mac-ansible.git ${ANSIBLE_PATH}

## ansible
cd ${ANSIBLE_PATH}
ansible-playbook -i inventory/localhost localhost.yml
