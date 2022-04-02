## Macの環境構築用Ansible

group_vars/localhost.ymlでbrew packageやvscode extensions等の指定ができる

M1でもIntelでも可

### 構築

```
curl -O https://raw.githubusercontent.com/KEY60228/mac-ansible/master/init.sh
zsh init.sh
```

### その他やること
- ターミナルのプロファイル設定をdotfiles/terminal/hoge.terminalから読み出す
- ssh-keygenしてGitHubに公開鍵を置く
- Chrome拡張機能追加
- 各種アカウントやDockの設定 etc...
