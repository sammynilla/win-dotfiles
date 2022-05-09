
vim.g.mapleader = " "

local map = vim.keymap.set

-- [[ disabled keybinds ]] --
map({ "n", "i", "v", "x" }, "<Left>",  "<nop>", { noremap = true })
map({ "n", "i", "v", "x" }, "<Down>",  "<nop>", { noremap = true })
map({ "n", "i", "v", "x" }, "<Up>",    "<nop>", { noremap = true })
map({ "n", "i", "v", "x" }, "<Right>", "<nop>", { noremap = true })
map({ "n", "i", "v", "x" }, "<C-z>",   "<nop>", { noremap = true })
map({ "n", "v", "x" }, "<S-K>", "<nop>", { noremap = true }) -- no man search
map("n", "q:",    "<nop>", { noremap = true }) -- no command history display
map("n", "<S-Q>", "<nop>", { noremap = true }) -- no "ex" mode
map("i", "<ESC>", "<nop>", { noremap = true })

-- [[ normal mode keybinds ]]
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })
map("n", "<C-Left>", ":vertical resize -2<cr>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize +2<cr>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize -2<cr>", { noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize +2<cr>", { noremap = true, silent = true })
map("n", "<C-s>", ":w<cr>", { noremap = true, silent = true })
map("n", "<A-p>", "\"*p", { noremap = true }) -- system clipboard paste

-- [[ interactive mode keybinds ]] --
map("i", "kj", "<ESC>", { noremap = true })
map("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

-- [[ visual mode keybinds ]] --
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
map("v", "<A-j>", ":m .+1<cr>==", { noremap = true })
map("v", "<A-k>", ":m .-2<cr>==", { noremap = true })

-- [[ visual-block mode keybinds ]] --
map("x", "<A-j>", ":move '>+1<cr>gv-gv", { noremap = true })
map("x", "<A-k>", ":move '<-2<cr>gv-gv", { noremap = true })

-- [[ multi-mode keybinds ]] --
map({ "n", "v" }, "p", "\"0p", { noremap = true }) -- non-volatile yank paste
map({ "n", "v" }, "P", "\"0p", { noremap = true })
map({ "v", "x" }, "x", "\"0x", { noremap = true }) -- non-volatile yank cut

-- [[ plugin keybinds ]] --
map("n", "n", function() require("highlight_current_n").n() end, { noremap = true })
map("n", "N", function() require("highlight_current_n").N() end, { noremap = true })
map("n", "<C-o>", ":CtrlPMRUFiles<cr>", { noremap = true })
map("n", "<C-b>", ":CtrlPBuffer<cr>", { noremap = true })

