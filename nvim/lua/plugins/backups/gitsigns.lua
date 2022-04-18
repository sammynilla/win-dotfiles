-----------------------------------------------------------
-- Gitsigns configuration file
-----------------------------------------------------------

-- Plugin: gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim

local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  return
end

-- TODO: Find a Unicode character that works with cmd.exe that doesn't look bad.
-- This may be an issue with my Input font or cmd.exe all together. I'm not particularly sure.
gitsigns.setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '┃', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '┃', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
})
