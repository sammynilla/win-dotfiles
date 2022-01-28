-- https://jdhao.github.io/2020/05/22/highlight_yank_region_nvim/#neovim-only
-- I'd like to figure out how to break this command down a little bit more.
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ higroup='IncSearch', timeout=700 })
  augroup end
]])
