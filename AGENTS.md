# AGENTS.md

個人 dotfiles。`install.sh` 會把 repo 內的檔案 symlink 到 `$HOME`，所以改 repo 就等於改目前使用中的設定。使用說明見 `README.md`。

## 規則

- 一律用中文跟使用者溝通，包含本文件的內容。
- commit message 用英文，遵循下方的 Conventional Commits 格式。
- 只在使用者要求時才 commit 或 push。在 `main` 上工作前先確認。
- 不把機密放進 repo：`.ssh/*` 只允許 `.ssh/config`，金鑰、token、`*.local.zsh` 都不進版本控制。
- 新增檔案時，要在 `install.sh` 的 `LINKS` 加一行，並更新 `README.md` 的表格。修改既有 symlink 目標的內容則不需要重跑 `install.sh`。
- 不還原使用者手動改過的設定（例如 `.gitconfig` 的 `side-by-side`），除非使用者明確要求。

## 結構

| 路徑 | 用途 |
| --- | --- |
| `install.sh` | 建立 symlink。`LINKS` 每行格式為 `<repo 路徑>  <$HOME 下的路徑>`，以 `read -r` 解析，**路徑不能含空白**。目標位置既有的檔案會被直接取代，不備份（靠 git 還原）。`layouts/.state/` 等 app 寫入的狀態在 `.gitignore` 排除 |
| `.zprofile` / `.zshrc` / `.zimrc` | login shell、互動 shell、zim 模組清單 |
| `zsh/<feature>.zsh` | 依功能分檔（shell、git、java 等），不依檔案類型分 |
| `zsh/brew.zsh` | `brew()` wrapper：`install` / `uninstall` 會同步更新 `Brewfile` |
| `Brewfile` | 套件清單。透過 wrapper 或 `brew bundle dump` 更新，不手動亂加 |
| `.gitconfig`、`.gitconfig-personal`、`.gitconfig-sporty` | 預設設定，加上依資料夾或 remote 以 `includeIf` 切換的帳號設定 |
| `.config/nvim/` | LazyVim。插件放在 `lua/plugins/*.lua`，每個檔案負責一類功能 |
| `.hammerspoon/init.lua` | Hammerspoon 設定（macOS 自動化，目前只有 ctrl+` 切換 herdr-app）。`~/.hammerspoon/Spoons/` 是 Hammerspoon 自己的，不進 repo |
| `.config/ghostty/config.ghostty` | Ghostty 設定。背景圖不進 repo（見 `.gitignore`） |
| `.config/herdr/config.toml` | herdr TUI 設定（TUI 已停用） |
| `.config/herdr-app/` | herdr-app 設定：`keys.json`、`settings.json` 兩個檔案，加上 `layouts/`、`themes/` 整個目錄。`shared.json`、`view.json`、`installed.json`、socket、`mods/` 等 app 寫入的狀態不進 repo（`install.sh` 只連結列出的路徑）。 |

## 驗證

改動後用對應工具確認，不只看文字：

- Ghostty：`ghostty +validate-config`，檢視生效值用 `ghostty +show-config`
- zsh：`zsh -n <file>`，再開新 shell 確認沒有錯誤輸出
- git 設定：`git config --show-origin --get <key>` 確認值與來源
- Brewfile：`brew bundle check --file=Brewfile`
- Neovim：插件改動後開 `nvim` 執行 `:Lazy sync`，或 `:checkhealth lazy`

## Commit 格式

採用 Conventional Commits：`type(scope): description`，需要時加 body。

- 常用 type：`feat`、`fix`、`chore`、`refactor`、`docs`
- scope 用功能名：`nvim`、`ghostty`、`git`、`zsh`、`brew`、`herdr`
- description 用祈使句、小寫開頭、結尾不加句號
