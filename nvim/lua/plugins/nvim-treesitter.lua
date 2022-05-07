
-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

local installed_languages = {
  "c", "cpp",
  "lua",
  "vim"
}

require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
  ensure_installed = installed_languages,
  highlight = { enable = true, },
  context_commentstring = { enable = true, },
  autotag = { enable = true, },
})

