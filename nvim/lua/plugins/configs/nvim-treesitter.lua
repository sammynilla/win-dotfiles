
-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

-- "c" parser is installed by default
local installed_languages = {
  "bash", "cpp", "lua", "markdown", "javascript", "json", "vim", "vue",
  -- add below this line for testing
}

-- require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
  ensure_installed = installed_languages,
  highlight = { enable = true, },
  indent = {
    enable = true,
    disable = { "yaml", },
  },
  playground = { enable = true, },
  autotag = { enable = true, },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

