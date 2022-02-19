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
-- cmd [[ au BufWritePre * :%s/\s\+$//e ]]
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
if fn.has('win32') then
  cmd [[
    command Term :botright :split term://cmd.exe /k C:\dev-tools\bin\alias.cmd
  ]]
end
-- Terminal visual tweaks
-- enter insert mode when switching to terminal
cmd [[
  augroup myterm | au!
    au TermOpen * if &buftype ==# 'terminal' | resize 12 | endif
    au TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    au TermOpen * startinsert
  augroup end
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtin plugins
local disabled_plugins = {
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  '2html_plugin',
  'tutor_mode_plugin',
  'matchit',
}

for _, plugin in pairs(disabled_plugins) do
  g["loaded_" .. plugin] = 1
end
-- disable nvim intro
opt.shortmess:append 'sI'
