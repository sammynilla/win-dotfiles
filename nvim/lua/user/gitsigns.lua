local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  return
end

gitsigns.setup({
  signs = {
    -- TODO: Find a Unicode character that works with cmd.exe that doesn't look bad.
    -- This may be an issue with my Input font or cmd.exe all together. I'm not particularly sure.
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '┃', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '┃', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
})
