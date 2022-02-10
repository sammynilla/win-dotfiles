-----------------------------------------------------------
-- Extras: Highlight Yank
-----------------------------------------------------------
local cmd = vim.cmd

-- https://jdhao.github.io/2020/05/22/highlight_yank_region_nvim/#neovim-only
cmd [[
  augroup YankHighlight
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{ higroup='IncSearch', timeout=700 }
  augroup end
]]
