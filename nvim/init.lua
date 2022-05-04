
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

-- Neovim init file
-- Latest Update: 2022/05/03
-- Maintainer: sammynilla
-- Website: https://github.com/sammynilla/win-dotfiles/tree/main/nvim

-- [[ required ]] --
require("plugins.packer")
-- [[ general ]] --
require("settings")
require("autocommands")
require("keymaps")
-- [[ theming ]] --
require("colorscheme")
-- [[ plugins ]] --
require("plugins.signify")
require("plugins.ctrlp")
require("plugins.markdown")
-- require("plugins.nvim-treesitter")
-- require("plugins/indent-blankline")

