-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------
local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

local ignored_languages = {
  'beancount', 'bibtex',
  'c_sharp', 'clojure', 'commonlisp', 'cuda',
  'd', 'dart', 'devicetree', 'dockerfile', 'dot',
  'eex', 'elixir', 'erlang',
  'fennel', 'fish', 'foam', 'fusion',
  'gdscript', 'glimmer',
  'ember',
  'gdscript', 'gdresource', 'glimmer', 'go', 'gomod', 'gowork',
  'hcl', 'heex', 'hjson', 'hocon',
  'java', 'jsdoc', 'jsonc', 'julia',
  'kotlin',
  'latex', 'ledger',
  'nix', 'norg',
  'ocaml', 'ocaml_interface', 'ocamllex',
  'pascal', 'php', 'phpdoc', 'pioasm', 'prisma', 'pug',
  'ql',
  'r', 'rasi', 'rst', 'ruby', 'rust',
  'scala', 'sparql', 'supercollider', 'surface', 'svelte',
  'teal', 'tlaplus', 'toml', 'tsx', 'turtle', 'typescript',
  'vala', 'verilog', 'vue',
  'yaml', 'yang',
  'zig'
}

configs.setup({
  ensure_installed = 'maintained',
  sync_install = false,
  ignore_install = ignored_languages,
  highlight = {
    enable = true,
    disable = {''},
    additional_vim_regex_highlighting = true, -- ??
  },
  context_commentstring = {
    enable = true,
  },
})
