-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------
local cmd = vim.cmd

cmd [[
try
  colorscheme kanagawa
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
