# dotfiles

`install.sh` 把 repo 裡的檔案 symlink 到 `$HOME`，改 repo 就等於改設定。

```sh
./install.sh          # 只建 symlink，既有檔案備份到 ~/.dotfiles-backup/
./install.sh --deps   # 順便 brew bundle 裝 Brewfile 裡的所有東西
```

| repo 檔案 | 連到 | 說明 |
| --- | --- | --- |
| `.zprofile` | `~/.zprofile` | login shell：Homebrew |
| `.zshrc` | `~/.zshrc` | zim → p10k 設定 → `zsh/*.zsh` |
| `Brewfile` | — | brew 套件清單。`brew install` / `uninstall` 會自動加入 / 移除（見 `zsh/brew.zsh`） |
| `.zimrc` | — | zim 模組清單（p10k、oh-my-zsh git、autosuggestions…），`zimfw update` 更新 |
| `zsh/<feature>.zsh` | — | 依功能分檔：`shell`、`nodejs`、`java`、`claude`… |
| `zsh/*.local.zsh` | — | 機器 / 公司專屬設定，git 忽略，最後載入 |
| `.p10k.zsh` | — | prompt 設定，`p10k configure` 會直接寫回這裡 |
