local fn = vim.fn

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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'  -- Package management [lua]
  use 'rebelot/kanagawa.nvim'   -- Color theme  [lua]
  --use 'lunarvim/darkplus.nvim'
  use 'windwp/nvim-autopairs'   -- Autopairs    [lua]
  use 'ctrlpvim/ctrlp.vim'      -- Fuzzy finder [vim]
  -- Treesitter [lua]
  use {
    -- On first run, :TSUpdate takes a while to install 
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
