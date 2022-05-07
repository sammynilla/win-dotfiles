
-- Plugins: vim-markdown, vim-pandoc-syntax
-- https://github.com/preservim/vim-markdown
-- https://github.com/vim-pandoc/vim-pandoc-syntax

-- [[ options ]] -
local enabled_options = {
  "folding_disabled",
  "no_default_key_mappings",
}

for _, option in pairs(enabled_options) do
  vim.g["vim_markdown_" .. option] = 1
end

-- [[ extensions ]] --
local enabled_extensions = {
  -- "math",
  -- "frontmatter",
  -- "toml_frontmatter",
  -- "json_frontmatter",
}

for _, extension in pairs(enabled_extensions) do
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

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  command = "set filetype=markdown.pandoc",
  pattern = { "*.md" },
  group = vim.api.nvim_create_augroup("pandoc_syntax", { clear = true, }),
})

