-- :help options
local options = {
  backup = false,
  clipboard = 'unnamedplus',
  cmdheight = 2,
  conceallevel = 0,
  fileencoding = 'utf-8',
  hlsearch = false, -- ??
  ignorecase = true,
  mouse = 'a',
  pumheight = 10,
  showmode = true,
  smartcase = true, -- ??
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 500,
  undofile = true,
  updatetime = 300,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = false,
  number = true,
  relativenumber = false,
  signcolumn = 'yes',
  wrap = false,
  -- scrolloff = 8      -- ??
  -- sidescrolloff = 8  -- ??
}

for key, val in pairs(options) do
  vim.opt[key] = val
end

-- Fix ctrl+c/v copy and paste on windows
if vim.fn.has('win32') == 1 then
  vim.cmd('source $VIMRUNTIME/mswin.vim')
end
