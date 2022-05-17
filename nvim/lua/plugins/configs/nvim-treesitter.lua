local installed_languages = {
  -- "c" parser is installed by default
  "astro", "cpp", "css", "javascript", "json", "lua", "markdown", "typescript",
  "vim", "vue",
}

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
