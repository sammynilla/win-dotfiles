-----------------------------------------------------------
-- Fuzzy file finder configuration file
-----------------------------------------------------------

-- Plugin: ctrlp.vim 
-- https://github.com/ctrlpvim/ctrlp.vim

local g = vim.g
local fn = vim.fn

g.ctrlp_line_prefix = ''
-- No interest in mru or buf. I use JABS for buffers.
g.ctrlp_types = {'fil'}
-- Set up this command by default
g.ctrlp_user_command = {
  '.git', 'cd %s && git ls-files -co --exclude-standard'
}

-- Ripgrep functionality requires that rg is available in PATH.
local rg_path
-- TODO (sammynilla): Add in distribution-based ignore globs and append to the general purpose ignore glob.
-- local rg_ignored_glob = '**/.git/*,**/node_modules/**'
local rg_installed = 0
if fn.has('win32') then
  rg_path = '%USERPROFILE%/scoop/apps/ripgrep'
-- elseif fn.has('unix') then
--   rg_path = '' -- Add a path here when we start using Linux
end

if fn.isdirectory(rg_path) ~= 0 then
  rg_installed = 1
end

if (rg_installed) then
  g.ctrlp_user_command = 'rg -. --files -g "!{**/.git/*,**/node_modules/**}"'
end
