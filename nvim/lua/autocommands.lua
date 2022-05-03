
local au = require("au")

au.TextYankPost = function()
  vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
end

au.BufEnter = {
  "*",
  function()
    vim.cmd([[set fo-=c fo-=r fo-=o]])
  end,
}

au.BufEnter = {
  "*.txt",
  function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd L")
      local nr = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_keymap(nr, "n", "q", ":q<CR>", { noremap = true, silent = true })
    end
  end,
}

au.FileType = {
  "markdown",
  function()
    vim.cmd([[setlocal cc=0 wrap linebreak]])
  end,
}

au({ "BufNewFile", "BufRead" }, {
  { ".eslintrc", ".prettierrc", "*.json*" },
  function()
    vim.bo.filetype = "json"
  end,
})

