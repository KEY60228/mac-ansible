#!/bin/bash

ANSIBLE_PATH=~/ansible

## command line toolsとhomebrewのinstall
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## architecture check
if [ `uname -m` = "arm64" ]; then
    ## M1の場合homebrewのパスを通す
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    source ~/.zprofile
fi

## ansibleのinstall
brew install ansible

## repositoryのclone
git clone https://github.com/KEY60228/mac-ansible.git ${ANSIBLE_PATH}

## ansible
cd ${ANSIBLE_PATH}
ansible-playbook -i inventory/localhost localhost.yml
