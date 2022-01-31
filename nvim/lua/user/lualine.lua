local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local branch = {
  'branch',
  icons_enabled = false,
  -- icon = 'nil
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local location = {
	"location",
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

lualine.setup({
  options = {
    icons_enabled = true,
    component_separators = '',
		section_separators = '',
  },
  sections = {
    lualine_a = { branch },
    lualine_b = { 'mode' },
    lualine_c = { 'filename' },
    lualine_x = {
      {
        'diff',
        source = diff_source,
      },
      {
        'fileformat',
        fmt = string.upper,
        icons_enabled = true,
        symbols = {
          unix  = 'unix',
          mac   = 'unix',
          dos   = 'dos',
        },
      },
      {
        'encoding',
        fmt = string.upper,
      },
    },
    lualine_y = { location },
    lualine_z = { progress },
  },
})
