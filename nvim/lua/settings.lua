-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
local g = vim.g

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
-- https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

opt.fileencoding = 'utf-8'
opt.timeoutlen = 500
opt.updatetime = 300
opt.wrap = false

-- Markdown files can use line break word wrap
cmd [[ au FileType markdown setlocal wrap linebreak ]]

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = false
opt.signcolumn = 'yes'
opt.showmode = false
opt.cmdheight = 2
opt.pumheight = 10
opt.colorcolumn = '80'
opt.cursorline = false
opt.splitright = true
opt.splitbelow = true

-- Remove extra whitespace on save
cmd [[ au BufWritePre * :%s/\s\+$//e ]]
-- Color column changes per file
cmd [[ au FileType markdown setlocal cc=0 ]]

-----------------------------------------------------------
-- Tabs, indents, comments
-----------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Don't auto comment new lines
cmd [[ au BufEnter * set fo-=c fo-=r fo-=o ]]

-----------------------------------------------------------
-- Search, fuzzy search
-----------------------------------------------------------
opt.hlsearch = false
opt.ignorecase = true   -- ignore case letters when search
opt.smartcase = true    -- ignore lowercase for the whole pattern

-- CTRL+P ignore all files within a project's .gitignore
g.ctrlp_user_command = {
  '.git',
  'cd %s && git ls-files -co --exclude-standard'
}

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- cmd [[command Term :botright vsplit term://cmd.exe]]
-- Terminal visual tweaks
-- enter insert mode when switching to terminal
cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable nvim intro
opt.shortmess:append 'sI'
