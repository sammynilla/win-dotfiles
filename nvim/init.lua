
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

-- Neovim init file
-- Latest Update: 2022/05/06
-- Maintainer: sammynilla
-- Website: https://github.com/sammynilla/win-dotfiles/tree/main/nvim

-- [[ general ]] --
require("settings")
require("autocommands")
require("keymaps")
-- [[ theming ]] --
require("colorscheme")
-- [[ plugins ]] --
require("plugins")
require("plugins.gitsigns")
require("plugins.ctrlp")
require("plugins.markdown")
-- require("plugins.nvim-treesitter")

local au = require("au")
au.group("ClearSearchHL", {
  { "CmdlineLeave", "/,\\?", "lua require(\"highlight_current_n\")[\"/,?\"]()", }
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "n", ":lua require('highlight_current_n').n()<CR>", opts)
vim.api.nvim_set_keymap("n", "N", ":lua require('highlight_current_n').N()<CR>", opts)

