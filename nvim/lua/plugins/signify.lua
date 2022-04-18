-----------------------------------------------------------
-- Gitsigns configuration file
-----------------------------------------------------------

-- Plugin: vim-signify 
-- https://github.com/mhinz/vim-signify

local g = vim.g
local cmd = vim.cmd

g.signify_sign_add = '┃'
g.signify_sign_delete = '┃'
g.signify_sign_delete_first_line = '┃'
g.signify_sign_change = '┃'
g.signify_sign_change_delete = '┃'

-- g.signify_sign_show_count = 1

cmd [[
  highlight SignifySignAdd ctermfg=green guifg=#76946A
  highlight SignifySignChange ctermfg=yellow guifg=#DCA561
  highlight SignifySignDelete ctermfg=red guifg=#C34043
  highlight link SignifySignChangeDelete SignifySignChange
  highlight link SignifySignDeleteFirstLine SignifySignDelete
]]
