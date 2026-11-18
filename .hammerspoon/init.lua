-- Hammerspoon 設定（需要「輔助使用」權限）
-- 同步到 ~/.hammerspoon/init.lua，見 install.sh

-- 讓 `hs` 命令列工具可以連到 Hammerspoon（例如 `hs -c 'hs.reload()'`）
require("hs.ipc")

local HERDR_BUNDLE = "dev.herdr.app"

-- ctrl+`：herdr-app 在前景就隱藏，否則叫到前景；沒在執行就啟動
hs.hotkey.bind({ "ctrl" }, "`", function()
  local app = hs.application.get(HERDR_BUNDLE)
  if not app then
    hs.application.launchOrFocusByBundleID(HERDR_BUNDLE)
  elseif app:isFrontmost() then
    app:hide()
  else
    app:unhide()
    app:activate(true)
  end
end)
