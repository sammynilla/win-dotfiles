local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
  return
end

local colors = require("kanagawa.colors").setup()
local overrides = {
  Pmenu = { fg = colors.fg_menu, bg = colors.sumiInk0, },
  PmenuSel = { fg = colors.fg_menu, bg = colors.sumiInk2, },
  PmenuThumb = { bg = colors.fg_menu, }, -- scroll bar color
  -- nvim-cmp fuzzy finder match
  CmpItemAbbrMatch = {
    fg = colors.fg_menu,
    underline = true,
    bold = true,
  },
}
kanagawa.setup({
  undercurl = false,
  commentStyle = {},
  -- functionStyle = {},
  keywordStyle = {},
  statementStyle = {},
  -- typeStyle = {},
  variablebuiltinStyle = {},
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
