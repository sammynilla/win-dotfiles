
vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  command = "set filetype=json",
  pattern = { "*.json*", },
})

