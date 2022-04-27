-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

local installed_languages = {
  'bash',
  'c', 'cmake', 'comment', 'cpp', 'css',
  'glsl', 'graphql',
  'help', 'html', 'http',
  'javascript', 'json', 'json5',
  'lua',
  'make',
  'ninja',
  'perl', 'python',
  'query',
  'regex',
  'scheme', 'scss',
  'toml',
  'vim', 'vue',
  'wgsl',
}

configs.setup({
  ensure_installed = installed_languages,
  sync_install = false,
  highlight = { enable = true, },
  context_commentstring = { enable = true, },
  autotag = { enable = true, },
})
