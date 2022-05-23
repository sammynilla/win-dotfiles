-- https://neovim.discourse.group/t/introducing-filetype-lua-and-a-call-for-help/1806
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
pcall(require, "impatient")

-- disable some built-in plugins that we don't need. increase load times.
local disabled_plugins = {
  "man",
  "gzip",
  "zip",
  "zipPlugin",
  "shada_plugin",
  "tar",
  "tarPlugin",
  "2html_plugin",
  "tutor_mode_plugin",
  "matchit",
  "netrwPlugin",
  "spellfile_plugin",
}
for _, plugin in ipairs(disabled_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

-- disable providers until we need them. increases checkhealth runtime.
local disabled_providers = { "node", "perl", "ruby", }
for _, provider in ipairs(disabled_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- [[ general ]] --
vim.o.title = true -- change the terminal's title
-- vim.o.mouse = "a" -- enable mouse for all modes
vim.o.clipboard = "unnamedplus"
vim.opt.shortmess:append("I") -- disable nvim intro
vim.o.timeoutlen = 500

-- [[ files ]] --
vim.o.encoding = "utf-8"
vim.o.wrap = false -- don't wrap lines
-- vim.opt.whichwrap:append("[]hl") -- move to prev/next line when cursor hits wrap
vim.o.showbreak = "↪ "
vim.o.list = true
vim.o.listchars = "tab:»·,extends:…,precedes:⟨,extends:⟩,nbsp:␣,eol:↴"
vim.opt.listchars:append("trail:•")
vim.fn.matchadd("errorMsg", [[\s\+$]]) -- highlight trailing whitespace

-- [[ recovery files ]] --
-- https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f
-- vim.o.updatetime = 300 -- duration before writing to swapfile
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true

-- [[ user interface ]] --
vim.o.number = true -- always show line numbers
vim.o.signcolumn = "yes"
vim.o.showmode = false -- do not show -- MODE -- in cmdline
vim.o.cmdheight = 1 -- height of the command line
vim.o.colorcolumn = "80"
vim.o.cursorline = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.statusline = ""
vim.opt.statusline:append("%f   ") -- filename (F for full path)
vim.opt.statusline:append("%<%{fugitive#statusline()}  %{get(b:,'gitsigns_status','')}")
vim.opt.statusline:append("%=") -- right align
vim.opt.statusline:append("%-8.(%l:%c%V%)")
-- [[ pop-up menu ]] --
vim.o.pumheight = 15
vim.o.wildmode = "longest,full"
vim.o.wildignorecase = true -- ignore case in command completion menu
vim.opt.shortmess:append("c") -- dont give ins-completion-menu messages

-- [[ tabs ]] --
vim.o.tabstop = 2 -- a tab is two spaces
vim.o.shiftwidth = vim.o.tabstop -- number of spaces to use for auto-indenting
vim.o.expandtab = true -- expand tabs to count tabstop n° of spaces
vim.o.smartindent = true -- insert tabs on the start of a line according to shiftwidth

-- [[ search ]] --
vim.o.ignorecase = true -- ignore case when searching with / or ?
vim.o.smartcase = true  -- ignore case if search pattern is all lowercase, case-sensitive otherwise
vim.opt.shortmess:append("s") -- dont give search hit bottom messages

require("colorscheme")
