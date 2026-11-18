# dotfiles

`install.sh` 把 repo 裡的檔案 symlink 到 `$HOME`，改 repo 就等於改設定。

```sh
./install.sh          # 只建 symlink，目標位置既有的檔案會直接被取代（不備份，用 git 還原）
./install.sh --deps   # 順便 brew bundle 裝 Brewfile 裡的所有東西
```

| repo 檔案 | 連到 | 說明 |
| --- | --- | --- |
| `.zprofile` | `~/.zprofile` | login shell：Homebrew |
| `.zshrc` | `~/.zshrc` | zim → p10k 設定 → `zsh/*.zsh` |
| `Brewfile` | — | brew 套件清單。`brew install` / `uninstall` 會自動加入 / 移除（見 `zsh/brew.zsh`） |
| `.zimrc` | — | zim 模組清單（p10k、oh-my-zsh git、autosuggestions…），`zimfw update` 更新 |
| `.gitconfig` | `~/.gitconfig` | 預設私人帳號；依資料夾或 remote 用 `includeIf` 切換 |
| `.gitconfig-personal` / `.gitconfig-sporty` | `~/` 同名 | 各帳號的 user 和 SSH key |
| `.ssh/config` | `~/.ssh/config` | GitHub 預設用私人 key。key 本身不進 repo |
| `.config/herdr/config.toml` | `~/.config/herdr/config.toml` | herdr 終端多工器設定 |
| `.config/ghostty/config.ghostty` | `~/.config/ghostty/config.ghostty` | Ghostty 設定，快捷鍵轉送給 herdr |
| `.config/herdr-app/keys.json`、`settings.json` | `~/.config/herdr-app/` 同名 | herdr-app 快捷鍵與個人設定 |
| `.config/herdr-app/layouts/` | `~/.config/herdr-app/layouts/` | herdr-app 版面（`layouts/.state/` 是點擊狀態，git 忽略） |
| `.config/herdr-app/themes/` | `~/.config/herdr-app/themes/` | herdr-app 主題 |
| `.config/nvim/` | `~/.config/nvim/` | Neovim（LazyVim）設定，插件裝在 `~/.local/share/nvim` 不進 repo |
| `.hammerspoon/init.lua` | `~/.hammerspoon/init.lua` | Hammerspoon：ctrl+` 切換 herdr-app 顯示/隱藏（需要輔助使用權限） |
| `zsh/<feature>.zsh` | — | 依功能分檔：`shell`、`nodejs`、`java`、`claude`… |
| `zsh/*.local.zsh` | — | 機器 / 公司專屬設定，git 忽略，最後載入 |
| `.p10k.zsh` | — | prompt 設定，`p10k configure` 會直接寫回這裡 |
