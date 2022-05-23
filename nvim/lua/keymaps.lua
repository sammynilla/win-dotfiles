vim.g.mapleader = ","

-- https://dev.to/voyeg3r/writing-useful-lua-functions-to-my-neovim-14ki
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- [[ disabled keybinds ]] --
map({ "n", "i", "v", "x" }, "<Left>",  "<nop>")
map({ "n", "i", "v", "x" }, "<Down>",  "<nop>")
map({ "n", "i", "v", "x" }, "<Up>",    "<nop>")
map({ "n", "i", "v", "x" }, "<Right>", "<nop>")
map({ "n", "i", "v", "x" }, "<C-z>",   "<nop>")
map({ "n", "v", "x" }, "<S-K>", "<nop>") -- no man search
map("n", "<C-c>", "<nop>")
map("n", "<S-Q>", "<nop>") -- no "ex" mode
map("i", "<Esc>", "<nop>")

-- [[ normal mode keybinds ]]
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-Left>",  ":vertical resize -2<cr>", { silent = true })
map("n", "<C-Down>",  ":resize +2<cr>", { silent = true })
map("n", "<C-Up>",    ":resize -2<cr>", { silent = true })
map("n", "<C-Right>", ":vertical resize +2<cr>", { silent = true })
map("n", "<C-s>", ":w<cr>", { silent = true })
map("n", "<A-p>", "\"*p") -- system clipboard paste
map("n", "<Leader><cr>", ":nohl<cr>", { silent = true })
map("n", "<Leader>ss", ":setlocal spell!<cr>", { silent = true }) -- spellcheck

-- [[ interactive mode keybinds ]] --
map("i", "kj", "<Esc>")

-- [[ visual mode keybinds ]] --
map("v", "<", "<gv")
map("v", ">", ">gv")

-- [[ visual-block mode keybinds ]] --
-- TODO: fix commands edge case not silencing top and bottom movement
map("x", "<A-j>", ":move '>+1<cr>gv=gv", { silent = true })
map("x", "<A-k>", ":move '<-2<cr>gv=gv", { silent = true })

-- [[ multi-mode keybinds ]] --
map({ "n", "v" }, "p", "\"0p") -- non-volatile yank paste
map({ "n", "v" }, "P", "\"0p")
map({ "v", "x" }, "x", "\"0x") -- non-volatile yank cut

-- [[ terminal mode keybinds ]] --
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- [[ plugin keybinds ]] --
local hlslens_commands = {
  [[<cmd>execute("normal! ".v:count1."n")<cr>:lua require("hlslens").start()<cr>]],
  [[<cmd>execute("normal! ".v:count1."N")<cr>:lua require("hlslens").start()<cr>]],
}
map("n", "n", hlslens_commands[1], { silent = true })
map("n", "N", hlslens_commands[2], { silent = true })
