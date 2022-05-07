
local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
  return
end

local base_colors = require("kanagawa.colors").setup()
local overrides = {
  Pmenu = { fg = base_colors.fg_menu, bg = base_colors.sumiInk0 },
}
kanagawa.setup({
  undercurl = false,
  commentStyle = "NONE",
  -- functionStyle = "NONE",
  keywordStyle = "NONE",
  statementStyle = "NONE",
  -- typeStyle = "NONE",
  variablebuiltinStyle = "NONE",
  -- specialReturn = true,
  -- specialException = true,
  dimInactive = true,
  -- globalStatus = false,
  overrides = overrides,
})

vim.cmd([[
try
  colorscheme kanagawa
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

