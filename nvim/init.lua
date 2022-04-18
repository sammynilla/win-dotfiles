--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


Neovim init file
Latest Update: 2022/04/16
Maintainer: sammynilla
Website: https://github.com/sammynilla/win-dotfiles/tree/main/nvim

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings')
require('keymaps')
require('colorscheme')
require('plugins/packer')
require('plugins/nvim-treesitter')
require('plugins/vim-markdown') -- Keep this here for now. Might remove.
require('plugins/indent-blankline')
require('plugins/signify')
-- require('plugins/lualine')
require('extras/yankhl')
