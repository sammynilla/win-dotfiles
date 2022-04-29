local wezterm = require('wezterm')

local default_prog;
local set_environment_variables = {};

-- https://github.com/wez/wezterm/discussions/628
function recompute_padding(window)
  local window_dims = window:get_dimensions()
  local overrides = window:get_config_overrides() or {}
  if not window_dims.is_full_screen then
    if not overrides.window_padding then
      return
    end
    overrides.window_padding = nil
  else
    local third = math.floor(window_dims.pixel_width / 3)
    local new_padding = {
      left = third,
      right = third,
      top = 0,
      bottom = 0
    }
    if overrides.window_padding and new_padding.left == overrides.window_padding.left then
      return
    end
    overrides.window_padding = new_padding
  end
  window:set_config_overrides(overrides)
end

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  -- local branch, stdout, stderr = wezterm.run_child_process({
  --   "git", "rev-parse", "--abbrev-ref", "HEAD"
  -- })
  set_environment_variables["prompt"] = "$E[35m$P $E[36m=>$E[0m "
  default_prog = {
    "cmd.exe", "/s", "/k",
    "c:/dev-tools/bin/alias.cmd", "&&",
    "%userprofile%/scoop/apps/clink/current/clink_x64.exe", "inject", "-q"
  }
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  set_environment_variables["prompt"] = ""
  default_prog = {}
end

wezterm.on(
  "window-resized",
  function(window, pane)
    recompute_padding(window)
  end
)

wezterm.on(
  "window-config-reloaded",
  function(window)
    recompute_padding(window)
  end
)

return {
  default_prog = default_prog,
  set_environment_variables = set_environment_variables,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
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
  },
  disable_default_key_bindings = true,
}
