-----------------------------------------------------------
-- Plugins configuration file
-----------------------------------------------------------
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

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'    -- Package management [lua]
  use 'nvim-lua/plenary.nvim'     -- Common Neovim modules [lua]
  use 'dstein64/vim-startuptime'  -- Vim startup profiling [vim]
  use 'rebelot/kanagawa.nvim'     -- Color theme  [lua]
  use 'windwp/nvim-autopairs'     -- Autopairs    [lua]
  use 'lukas-reineke/indent-blankline.nvim' -- Whitespace and indents [lua]
  use 'ctrlpvim/ctrlp.vim'        -- Fuzzy finder [vim]
  use 'tpope/vim-commentary'      -- Comments [vim]
  -- use 'nvim-lualine/lualine.nvim' -- Status Line [lua]

  use { -- Multiple language syntax highlights [lua]
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Comments [lua]
  use 'preservim/vim-markdown' -- Markdown syntax highlighting[vim]
  use {
    'iamcco/markdown-preview.nvim', -- [lua]
    run = ':call mkdp#util#install()'
  }
  -- Git
  use {
    'lewis6991/gitsigns.nvim', -- [lua]
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
