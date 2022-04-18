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
  use 'rebelot/kanagawa.nvim' -- Color Theme
  use 'tpope/vim-commentary' -- Motion based commenting
  -- [[ Navigation ]] -- 
  use 'ctrlpvim/ctrlp.vim' -- Fuzzy finder
  -- [[ Git ]] --
  use 'mhinz/vim-signify' -- Git diff signs, line highlight, hunks
  use { 'junegunn/gv.vim', requires = { 'tpope/vim-fugitive', }, }
  -- [[ Syntax Highlighting ]] --
  use 'preservim/vim-markdown'
  -- [[ Writing ]] --
  use {
    'iamcco/markdown-preview.nvim',
    run = ':call mkdp#util#install()'
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- Indentation and whitespace guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- Treesitter interface
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Markdown preview via web browser

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
