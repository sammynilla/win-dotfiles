
local ok, kanagawa = pcall(require, "kanagawa")
if ok then
  kanagawa.setup({
    undercurl = false,
    commentStyle = "NONE",
    -- functionStyle = "NONE",
    keywordStyle = "NONE",
    statementStyle = "NONE",
    -- typeStyle = "NONE",
    variablebuiltinStyle = "NONE",
    -- specialReturn = true,
    -- specialException = true,
    dimInactive = true,
    -- globalStatus = false,
  })
end

vim.cmd([[
try
  colorscheme kanagawa
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

