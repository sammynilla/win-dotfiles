-----------------------------------------------------------
-- Keymaps configuration file
-- Keymaps of neovim and plugins.
-----------------------------------------------------------

-----------------------------------------------------------
--                    - Input Modes -
-- ────────┬────────┬────────┬────────┬──────────┬─────────
--  Normal │ Insert │ Visual │ VBlock │ Terminal │ Command
-- ────────┼────────┼────────┼────────┼──────────┼─────────
--   'n'   │  'i'   │  'v'   │  'x'   │   't'    │   'c'
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- Prevent myself from using arrow keys.
map('', '<Up>',     '<nop>',  { noremap = true })
map('', '<Down>',   '<nop>',  { noremap = true })
map('', '<Left>',   '<nop>',  { noremap = true })
map('', '<Right>',  '<nop>',  { noremap = true })

local n = {
  -- Move around buffer splits with Ctrl + {h,j,k,l}
  ['<C-h>'] = '<C-w>h',
  ['<C-j>'] = '<C-w>j',
  ['<C-k>'] = '<C-w>k',
  ['<C-l>'] = '<C-w>l',
  -- Resize buffer splits with Ctrl + arrow
  ['<C-Up>'] = ':resize -2<CR>',
  ['<C-Down>'] = ':resize +2<CR>',
  ['<C-Left>'] = ':vertical resize -2<CR>',
  ['<C-Right>'] = ':vertical resize +2<CR>',
  -- Navigate buffers with Shift + {h,l}
  ['<S-h>'] = ':bprevious<CR>',
  ['<S-l>'] = ':bnext<CR>',
  -- Save current buffer file with Ctrl + {s}
  ['<C-s>'] = ':w<CR>'
}

for key, val in pairs(n) do
  map('n', key, val, opts)
end

local i = {
  -- Prevent myself from using Escape.
  ['kj'] = '<ESC>',
}

for key, val in pairs(i) do
  map('i', key, val, opts)
end

local v = {
  -- Shift indents in visual mode 
  ['<'] = '<gv',
  ['>'] = '>gv',
  -- Move selected text from cursor up and down using Alt + {j,k}
  ['<A-j>'] = ':m .+1<CR>==',
  ['<A-k>'] = ':m .-2<CR>==',
  -- Stop paste from yanking old text
  ['p'] = '_dP',
}

for key, val in pairs(v) do
  map('v', key, val, opts)
end

local vbl = { -- Visual Block and Line
  -- Move selected text from cursor up and down using Alt + {j,k}
  ['<A-j>'] = [[:move '>+1<CR>gv-gv]],
  ['<A-k>'] = [[:move '<-2<CR>gv-gv]],
}

for key, val in pairs(vbl) do
  map('x', key, val, opts)
end

local t = {
  -- Temporary use of Escape to close the buffer for the terminal.
  ['<ESC>'] = [[<C-\><C-n>:bd!<CR>]],
}

for key, val in pairs(t) do
  map('t', key, val, opts)
end
