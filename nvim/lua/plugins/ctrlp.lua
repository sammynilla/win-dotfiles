
-- Plugin: ctrlp.vim
-- https://github.com/ctrlpvim/ctrlp.vim

vim.g.ctrlp_line_prefix = "█"

local rg_ignored_glob = "**/.git/*,**/node_modules/**"
if vim.fn.executable("rg") then
  vim.g.ctrlp_user_command = "rg -. --files -g \"!{"..rg_ignored_glob.."}\""
else
  vim.g.ctrlp_user_command = {
    ".git", "cd %s && git ls-files -co --exclude-standard"
  }
end

vim.api.nvim_set_keymap("n", "<C-o>", ":CtrlPMRUFiles<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-b>", ":CtrlPBuffer<CR>", { noremap = true })
