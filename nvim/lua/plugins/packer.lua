-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local cmd = vim.cmd

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenever you save plugins.lua
cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]]

-----------------------------------------------------------
-- Packer and plugin setup
-----------------------------------------------------------
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function()
  -- [[ General ]] --
  use 'wbthomason/packer.nvim'
  use 'dstein64/vim-startuptime' -- System profiling
  use 'tpope/vim-commentary' -- Motion based commenting
  use 'andweeb/presence.nvim' -- Discord rich presence
  use 'ntpeters/vim-better-whitespace' -- Whitespace highlighting
  -- [[ Theming ]] --
  use 'rebelot/kanagawa.nvim' -- Color Theme
  use 'ryanoasis/vim-devicons'
  -- [[ Navigation ]] --
  use 'ctrlpvim/ctrlp.vim' -- Fuzzy finder
  use { -- Jump to line numbers
    'nacro90/numb.nvim', config = require('numb').setup({ number_only = true })
  }
  -- [[ Git ]] --
  use 'mhinz/vim-signify' -- Git diff signs, line highlight, hunks
  use { 'junegunn/gv.vim', requires = { 'tpope/vim-fugitive' } }
  -- [[ Syntax Highlighting ]] --
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'preservim/vim-markdown'
  -- [[ Text Editing ]] --
  use 'windwp/nvim-ts-autotag'
  use { 'windwp/nvim-autopairs', config = require('nvim-autopairs').setup() }
  -- [[ Writing ]] --
  use { 'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()' }

  -- Indentation and whitespace guides
  -- use 'lukas-reineke/indent-blankline.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
