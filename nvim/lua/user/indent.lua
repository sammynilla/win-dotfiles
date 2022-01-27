local status_ok, indent = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

vim.opt.list = true
-- cmd.exe doesn't seem to natively support U+22C5 (Dot Operator).
-- vim.opt.listchars:append('space:·')
vim.opt.listchars:append('eol:¬')

indent.setup({
  show_end_of_line = true,
  space_char_blankline = ' ',
})
