#!/bin/bash

ANSIBLE_PATH=~/ansible

## command line toolsのinstall
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
fi

## homebrewのinstall&update
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update

## architecture check
if [ `uname -m` = "arm64" ]; then
    ## M1の場合homebrewのパスを通す
    if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' ~/.zprofile 2>/dev/null; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    fi
    source ~/.zprofile
fi

## ansibleのinstall
if ! command -v ansible &>/dev/null; then
    brew install ansible
fi

## repositoryのclone
if [ ! -d "${ANSIBLE_PATH}" ]; then
    git clone https://github.com/KEY60228/mac-ansible.git ${ANSIBLE_PATH}
fi

## キー長押しで連続入力できるようにする
defaults write -g ApplePressAndHoldEnabled -bool false

## Spotlightのショートカットキーを無効化
defaults write -g com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '{enabled = 0; value = { parameters = (); type = "standard"; }; }'

## 音声入力ショートカットを無効化
defaults write -g com.apple.speech.recognition.AppleSpeechRecognitionData "HotKey" -int 0

## リピート速度を設定 (値は1から120の範囲)
defaults write -g KeyRepeat -int 2

## リピートの遅延を設定 (値は0から120の範囲)
defaults write -g InitialKeyRepeat -int 15

## ansibleの実行
cd ${ANSIBLE_PATH}
ansible-playbook -i inventory/localhost localhost.yml
