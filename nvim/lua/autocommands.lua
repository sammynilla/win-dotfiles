
local augroup_common = vim.api.nvim_create_augroup("user_common", {})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = vim.api.nvim_create_augroup("YankHighlight", {}),
})

vim.api.nvim_create_autocmd("BufEnter", {
  command = "set fo-=c fo-=r fo-=o",
  pattern = { "*" },
  group = augroup_common,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd L")
      local nr = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_keymap(nr, "n", "q", ":q<CR>", { noremap = true, silent = true })
    end
  end,
  pattern = { "*.txt" },
  group = augroup_common,
})

vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal cc=0 wrap linebreak",
  pattern = { "markdown" },
  group = augroup_common,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  callback = function() vim.bo.filetype = "json" end,
  pattern = { ".eslintrc", ".prettierrc", "*.json*", },
  group = augroup_common,
})

