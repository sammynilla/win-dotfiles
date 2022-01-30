local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  terminal_mode = "t"
--  command_mode = "c"

-- Normal --
local normal_mode = {
  -- Window Navigation
  ['<C-h>'] = '<C-w>h',
  ['<C-j>'] = '<C-w>j',
  ['<C-k>'] = '<C-w>k',
  ['<C-l>'] = '<C-w>l',
  -- Resize with arrows
  ['<C-Up>'] = ':resize -2<CR>',
  ['<C-Down>'] = ':resize +2<CR>',
  ['<C-Left>'] = ':vertical resize -2<CR>',
  ['<C-Right>'] = ':vertical resize +2<CR>',
  -- Navigate buffers
  ['<S-l>'] = ':bnext<CR>',
  ['<S-h>'] = ':bprevious<CR>',
}

for key, val in pairs(normal_mode) do
  keymap('n', key, val, opts)
end

-- Insert --
local insert_mode = {
  -- Avoid using escape
  ['kj'] = '<ESC>',
}

for key, val in pairs(insert_mode) do
  keymap('i', key, val, opts)
end

-- Visual --
local visual_mode = {
  -- Stay in indent mode
  ['<'] = '<gv',
  ['>'] = '>gv',
  -- Move text up and down
  ['<A-j>'] = ':m .+1<CR>==',
  ['<A-k>'] = ':m .-2<CR>==',
  -- Stop paste from yanking old text
  ['p'] = '_dP',
}

for key, val in pairs(visual_mode) do
  keymap('v', key, val, opts)
end

-- Visual Block --
local visual_block_mode = {
  ['J'] = [[:move '>+1<CR>gv-gv]],
  ['K'] = [[:move '<-2<CR>gv-gv]],
  ['<A-j>'] = [[:move '>+1<CR>gv-gv]],
  ['<A-k>'] = [[:move '<-2<CR>gv-gv]],
}

for key, val in pairs(visual_block_mode) do
  keymap('x', key, val, opts)
end

-- Terminal --
local terminal_mode = {
  ['<ESC>'] = [[<C-\><C-n>:bd!<CR>]],
}

for key, val in pairs(terminal_mode) do
  keymap('t', key, val, opts)
end
