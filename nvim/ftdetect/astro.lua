vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  command = "set filetype=astro",
  pattern = { "*.astro", },
})
