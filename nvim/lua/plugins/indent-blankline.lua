-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

local opt = vim.opt

local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

opt.list = true
-- cmd.exe doesn't seem to natively support U+22C5 (Dot Operator).
-- Below is an alternative we could use
-- opt.listchars:append('space:·')
opt.listchars:append('eol:¬')

indent_blankline.setup({
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
  filetype_exclude = {
    'checkhealth',
    'help',
    'markdown',
    'text',
    'packer',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
  char_list = { '│', '¦', '¦', },
  indent_level = 3,
  -- use_treesitter = true,
  -- Browse context patterns a bit more for the future (requires Treesitter).
  -- context_patterns = {},
  -- context_pattern_highlight = {},
})
