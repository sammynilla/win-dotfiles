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

return {
  dpi = 96.0,
  font_size = 12.0,
  front_end = "OpenGL",
  prefer_egl = true,
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
  -- hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  default_prog = default_prog,
  disable_default_key_bindings = true,
  leader = { key = "`", },
  keys = {
    { key = "Tab", mods = "CTRL", action = wezterm.action { ActivateTabRelative=1 }},
    { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action { ActivateTabRelative=-1 }},
    { key = "Enter", mods = "ALT", action = "ToggleFullScreen" },
    { key = "n", mods = "CTRL|SHIFT", action = "SpawnWindow" },
    { key = "t", mods = "LEADER", action = wezterm.action { SpawnTab = "CurrentPaneDomain" }},
    { key = "x", mods = "LEADER", action = wezterm.action { CloseCurrentTab = { confirm = true }}},
    { key = "1", mods = "LEADER", action = wezterm.action { ActivateTab = 0 }},
    { key = "2", mods = "LEADER", action = wezterm.action { ActivateTab = 1 }},
    { key = "3", mods = "LEADER", action = wezterm.action { ActivateTab = 2 }},
    { key = "4", mods = "LEADER", action = wezterm.action { ActivateTab = 3 }},
    { key = "5", mods = "LEADER", action = wezterm.action { ActivateTab = 4 }},
    { key = "`", mods = "LEADER", action = wezterm.action { SendString="`" }},
  }
}
