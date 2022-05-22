vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  command = "setlocal cc=0 wrap linebreak",
  pattern = { "*.md" },
})
