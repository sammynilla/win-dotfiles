
local augroup_common = vim.api.nvim_create_augroup("user_common", {})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = vim.api.nvim_create_augroup("YankHighlight", {}),
})

-- disable comment newline
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
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

-- [[ plugin auto-commands ]] --
vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  command = "set filetype=markdown.pandoc",
  pattern = { "*.md" },
  group = vim.api.nvim_create_augroup("pandoc_syntax", {}),
})

-- applies highlight at cursor after search
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    require("highlight_current_n")["/,?"]()
  end,
  group = vim.api.nvim_create_augroup("ClearSearchHL", {}),
  pattern = "/,\\?",
})

-- auto-compile our packer configuration
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
  group = vim.api.nvim_create_augroup("packer", {}),
})

