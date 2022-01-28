local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

local ignored_languages = {
  'beancount', 'bibtex',
  'clojure', 'commonlisp', 'cuda',
  'd', 'dart', 'devicetree', 'dockerfile', 'dot',
  'eex', 'elixir', 'erlang',
  'fennel', 'fish', 'foam', 'fusion',
  'gdscript', 'glimmer',
  'ember',
  'go', 'gdresource', 'gomod', 'gowork',
  'hcl', 'heex', 'hjson', 'hocon',
  'java', 'julia',
  'kotlin',
  'latex', 'ledger',
  'nix', 'norg',
  'ocaml', 'ocaml_interface', 'ocamllex',
  'pascal', 'php', 'phpdoc', 'pioasm', 'prisma', 'pug',
  'ql',
  'r', 'rasi', 'rst', 'ruby', 'rust',
  'scala', 'sparql', 'supercollider', 'surface', 'svelte',
  'teal', 'tlaplus', 'toml', 'tsx', 'turtle', 'typescript',
  'verilog', 'vue',
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
})