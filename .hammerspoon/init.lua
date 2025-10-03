-- WezTerm の Bundle ID
local BUNDLE_ID = "com.github.wez.wezterm"

-- Option + Space でトグル
hs.hotkey.bind({ "alt" }, "space", function()
  local app = hs.application.get(BUNDLE_ID)

  if not app then
    -- まだ起動していなければ起動
    hs.application.launchOrFocusByBundleID(BUNDLE_ID)
    return
  end

  if app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocusByBundleID(BUNDLE_ID)
  end
end)
