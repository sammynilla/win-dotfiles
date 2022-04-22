-----------------------------------------------------------
-- Fuzzy file finder configuration file
-----------------------------------------------------------

-- Plugin: ctrlp.vim 
-- https://github.com/ctrlpvim/ctrlp.vim

local g = vim.g
local fn = vim.fn

g.ctrlp_line_prefix = '█ '

-- NOTE (sammynilla): MRU has to be available otherwise dev-icons fail to load.
-- g.ctrlp_types = {'fil', 'buf'}

local rg_ignored_glob = '**/.git/*,**/node_modules/**'
if fn.executable('rg') then
  g.ctrlp_user_command = 'rg -. --files -g "!{'..rg_ignored_glob..'}"'
else
  g.ctrlp_user_command = {
    '.git', 'cd %s && git ls-files -co --exclude-standard'
  }
end
