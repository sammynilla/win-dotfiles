
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  command = "set filetype=json",
  pattern = { ".eslintrc", ".prettierrc", "*.json*", },
})

