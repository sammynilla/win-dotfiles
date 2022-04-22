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

local n = {
  -- Disable arrow keys in normal mode. Use {h,j,k,l}
  ['<Left>'] = '<nop>',
  ['<Down>'] = '<nop>',
  ['<Up>'] = '<nop>',
  ['<Right>'] = '<nop>',
  -- Move around buffer splits with Ctrl + {h,j,k,l}
  ['<C-h>'] = '<C-w>h',
  ['<C-j>'] = '<C-w>j',
  ['<C-k>'] = '<C-w>k',
  ['<C-l>'] = '<C-w>l',
  -- Resize buffer splits with Ctrl + arrow
  ['<C-Left>'] = ':vertical resize -2<CR>',
  ['<C-Down>'] = ':resize +2<CR>',
  ['<C-Up>'] = ':resize -2<CR>',
  ['<C-Right>'] = ':vertical resize +2<CR>',
  -- Save current buffer file with Ctrl + {s}
  ['<C-s>'] = ':w<CR>',
  -- Paste from non-volatile yank register
  ['p'] = '"0p',
  ['P'] = '"0p',
  -- Paste from system clipboard
  ['<A-p>'] = '"*p',
  -- Bug fix? On windows Ctrl + {z} causes terminal to freeze
  ['<C-z>'] = '<nop>',
  -- Disable annoying 'ex' mode
  ['<S-Q>'] = '<nop>',
  -- [[ PLUGINS ]] --
  ['<C-o>'] = ':CtrlPMRUFiles<CR>',
  ['<C-b>'] = ':CtrlPBuffer<CR>'
}

for key, val in pairs(n) do
  map('n', key, val, opts)
end

local i = {
  -- STOP using arrow keys!
  ['<Left>'] = '<nop>',
  ['<Down>'] = '<nop>',
  ['<Up>'] = '<nop>',
  ['<Right>'] = '<nop>',
  -- Prevent myself from using Escape.
  ['<ESC>'] = '<nop>',
  ['kj'] = '<ESC>',
}

for key, val in pairs(i) do
  map('i', key, val, opts)
end

local v = {
  -- STOP using arrow keys!
  ['<Left>'] = '<nop>',
  ['<Down>'] = '<nop>',
  ['<Up>'] = '<nop>',
  ['<Right>'] = '<nop>',
  -- Shift indents in visual mode
  ['<'] = '<gv',
  ['>'] = '>gv',
  -- Move selected text from cursor up and down using Alt + {j,k}
  ['<A-j>'] = ':m .+1<CR>==',
  ['<A-k>'] = ':m .-2<CR>==',
  -- Paste from non-volatile yank register
  ['p'] = '"0p',
  ['P'] = '"0p',
  -- Cut entire block and move to non-volatile yank register.
  ['x'] = '"0x',
}

for key, val in pairs(v) do
  map('v', key, val, opts)
end

local vbl = { -- Visual Block and Line
  -- STOP using arrow keys!
  ['<Left>'] = '<nop>',
  ['<Down>'] = '<nop>',
  ['<Up>'] = '<nop>',
  ['<Right>'] = '<nop>',
  -- Move selected text from cursor up and down using Alt + {j,k}
  ['<A-j>'] = [[:move '>+1<CR>gv-gv]],
  ['<A-k>'] = [[:move '<-2<CR>gv-gv]],
  -- Cut entire block and move to non-volatile yank register.
  ['x'] = '"0x',
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
