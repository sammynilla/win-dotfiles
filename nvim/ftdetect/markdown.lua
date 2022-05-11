
vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal cc=0 wrap linebreak",
  pattern = { "markdown" },
})
