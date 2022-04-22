--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


Neovim init file
Latest Update: 2022/04/21
Maintainer: sammynilla
Website: https://github.com/sammynilla/win-dotfiles/tree/main/nvim

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
-- [[ Required ]] --
require('plugins/packer')
-- [[ General ]] --
require('settings')
require('keymaps')
require('colorscheme')
-- [[ Plugins ]] --
require('plugins/signify')
require('plugins/ctrlp')
require('plugins/nvim-treesitter')
require('plugins/indent-blankline')
-- require('plugins/lualine')
require('plugins/vim-markdown') -- Keep this here for now. Might remove.
require('extras/yankhl')
