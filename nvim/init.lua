--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


Neovim init file
Latest Update: 2022/02/10
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
require('plugins/treesitter')
require('plugins/autopairs')
require('plugins/indentline')
require('plugins/gitsigns')
-- require('plugins/lualine')
require('extras/yankhl')
