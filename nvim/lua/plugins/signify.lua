
-- Plugin: vim-signify
-- https://github.com/mhinz/vim-signify

vim.g.signify_sign_add = "┃"
vim.g.signify_sign_delete = "┃"
vim.g.signify_sign_delete_first_line = "┃"
vim.g.signify_sign_change = "┃"
vim.g.signify_sign_change_delete = "┃"

vim.cmd([[
  highlight SignifySignAdd ctermfg=green guifg=#76946A
  highlight SignifySignChange ctermfg=yellow guifg=#DCA561
  highlight SignifySignDelete ctermfg=red guifg=#C34043
  highlight link SignifySignChangeDelete SignifySignChange
  highlight link SignifySignDeleteFirstLine SignifySignDelete
]])

