-- [[ options ]] -
local enabled_options = {
  "folding_disabled",
  "no_default_key_mappings",
}

for _, option in ipairs(enabled_options) do
  vim.g["vim_markdown_" .. option] = 1
end

-- [[ extensions ]] --
local enabled_extensions = {
  -- "math",
  -- "frontmatter",
  -- "toml_frontmatter",
  -- "json_frontmatter",
}

for _, extension in ipairs(enabled_extensions) do
  vim.g["vim_markdown_" .. extension] = 1
end

-- [[ additional configuration ]] --
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_fenced_languages = {
  "c++=cpp",
  "csharp=cs",
  "viml=vim",
  "bash=sh",
  "ini=dosini"
}
