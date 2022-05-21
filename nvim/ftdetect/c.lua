vim.api.nvim_create_autocmd("FileType", {
  callback = function() 
    vim.bo.cindent = false
  end,
  pattern = { "c,cpp" },
})
