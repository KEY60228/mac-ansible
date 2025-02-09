## Macの環境構築用Ansible

M1でもIntelでも可

### 構築

```sh
curl -O https://raw.githubusercontent.com/KEY60228/mac-ansible/master/clone.sh
zsh clone.sh

# TODO: dotfilesの調整

cd ~/ansible
ansible-playbook -i inventory/localhost localhost.yml
```

### その他やること
- ssh-keygenしてGitHubに公開鍵を置く
- 各種アカウントやDockの設定 etc...
