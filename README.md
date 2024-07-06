## gcloud CLI の認証(ログイン)
```zsh
gcloud auth application-default login
```

```zsh
vi ~/.zshrc
alias gcloud auth login='gcloud auth application-default login'
source ~/.zshrc
```
