local status_ok, wezterm = pcall(require, 'wezterm')
if not status_ok then
  return
end

local default_prog;
local set_environment_variables = {};

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  set_environment_variables["prompt"] = "$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m "
  default_prog = {
    "cmd.exe", "/s", "/k",
    "c:/dev-tools/bin/alias.cmd", "&&",
    "%userprofile%/scoop/apps/clink/current/clink_x64.exe", "inject", "-q"
  }
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  set_environment_variables["prompt"] = ""
  default_prog = {}
end

return {
  default_prog = default_prog,
  set_environment_variables = set_environment_variables,
  enable_tab_bar = false,
  window_padding = {
    left = 5,
    right = 5,
    top = 8,
    bottom = 0,
  },

  force_reverse_video_cursor = true,
  color_scheme_dirs = {"c:/users/samantha/.config/wezterm/colors"},
  color_scheme = "kanagawa",
	colors = {
    indexed = {
      [16] = "#ffa066",
      [17] = "#ff5d62",
    },
  }
}
