## Macの環境構築用Ansible

M1でもIntelでも可

### 構築

1. setup
```sh
curl -O https://raw.githubusercontent.com/KEY60228/mac-ansible/master/setup.sh
zsh setup.sh
```

2. fix dotfiles

3. brew bundle
```sh
zsh brew.sh
```

### その他やること
- ssh-keygenしてGitHubに公開鍵を置く
- 各種アカウントやDockの設定 etc...
