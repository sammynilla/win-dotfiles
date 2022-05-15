
local wezterm = require("wezterm")

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  default_prog = {
    "pwsh.exe", "-NoLogo", "-NoExit",
    "-File", os.getenv("XDG_CONFIG_HOME") .. "/profile.ps1"
  }
end

if wezterm.target_triple == "x86_64-apple-darwin" then
  set_environment_variables["prompt"] = ""
  default_prog = {}
end

-- https://github.com/wez/wezterm/discussions/628
-- function recompute_padding(window)
--   local window_dims = window:get_dimensions()
--   local overrides = window:get_config_overrides() or {}
--   if not window_dims.is_full_screen then
--     if not overrides.window_padding then
--       return
--     end
--     overrides.window_padding = nil
--   else
--     local third = math.floor(window_dims.pixel_width / 3)
--     local new_padding = {
--       left = third,
--       right = third,
--       top = 0,
--       bottom = 0
--     }
--     if overrides.window_padding and new_padding.left == overrides.window_padding.left then
--       return
--     end
--     overrides.window_padding = new_padding
--   end
--   window:set_config_overrides(overrides)
-- end

-- wezterm.on("window-resized", function(window, pane)
--   recompute_padding(window)
-- end)

-- wezterm.on("window-config-reloaded", function(window)
--   recompute_padding(window)
-- end)

return {
  dpi = 96.0,
  font_size = 12.0,
  front_end = "OpenGL",
  prefer_elg = true,
  color_scheme_dirs = { os.getenv("XDG_CONFIG_HOME") .. "/wezterm/colors" },
  color_scheme = "kanagawa",
  colors = {
    indexed = {
      [16] = "#ffa066",
      [17] = "#ff5d62",
    },
  },
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    left = 5,
    right = 5,
    top = 8,
    bottom = 0,
  },
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  default_prog = default_prog,
  disable_default_key_bindings = true,
  -- leader = { key = "n", mods = "SUPER", timeout_milliseconds = 2000 },
  keys = {
    -- { key = "r", mods = "LEADER", action = "ReloadConfiguration" },
    { key = "Enter", mods = "ALT", action = "ToggleFullScreen" },
  }
}

