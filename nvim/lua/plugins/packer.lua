
-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local execute = vim.api.nvim_command

-- bootstrap
local PACKER_BOOTSTRAP = nil
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

-- auto-compile
local au = require("au")
au.group("PackerGroup", {
  { "BufWritePost", "packer.lua", "source <afile> | PackerCompile" },
})

require("packer").init({
  autoremove = true, -- remove disabled or unused plugins without a prompt
})

return require("packer").startup({ function(use)
  -- [[ general ]] --
  use ({ "wbthomason/packer.nvim" })
  use ({ "lewis6991/impatient.nvim" })
  use ({ "andweeb/presence.nvim" }) -- discord rich presence
  use ({ "dstein64/vim-startuptime" }) -- system profiling
  use ({ "tpope/vim-commentary" }) -- motion based commenting
  use ({ "ntpeters/vim-better-whitespace" }) -- whitespace highlighting
  -- use ({ "rktjmp/highlight-current-n.nvim" })

  -- [[ theming ]] --
  use ({
    "rebelot/kanagawa.nvim", -- color theme
    run = function() execute("colorscheme kanagawa") end,
  })
  use ({ "ryanoasis/vim-devicons" })
  -- [[ navigation ]] --
  use ({ "ctrlpvim/ctrlp.vim" }) -- fuzzy finder
  use ({
    "nacro90/numb.nvim", -- jump to line numbers
    -- config = function() require("numb").setup() end,
    -- run = function() require("numb").setup() end,
  })

  -- [[ git ]] --
  use ({
    "mhinz/vim-signify", -- git diff signs, line highlight, hunks
    config = function()
      -- TODO: re-evaluate how we're accomplishing this
      vim.cmd([[source ~/.config/nvim/lua/plugins/signify.lua]])
    end,
  })
  use ({ "junegunn/gv.vim", requires = { "tpope/vim-fugitive" } })

  -- [[ syntax highlighting ]] --
  -- use ({
  --   "nvim-treesitter/nvim-treesitter",
  --   run = ":TSUpdate",
  --   config = function() require("plugins.nvim-treesitter") end,
  -- })
  -- use ({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use ({ "preservim/vim-markdown", })
  use ({ "vim-pandoc/vim-pandoc-syntax", })

  -- [[ text editing ]] --
  -- use ({ "windwp/nvim-ts-autotag" })
  -- use ({
  --   "windwp/nvim-autopairs",
  --   -- run = function() require("nvim-autopairs").setup() end,
  -- })

  -- [[ writing ]] --
  -- TODO: markdown-preview installation is fairly slow and heavy, afterwards it's not a big deal.
  --       maybe it's better to try out Glow or install this as an optional plugin.
  -- use ({ "iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()" })

  -- indentation and whitespace guides
  -- use ({ "lukas-reineke/indent-blankline.nvim" })

  -- auto-sync if first time running.
  if PACKER_BOOTSTRAP ~= nil then
    require("packer").sync()
    PACKER_BOOTSTRAP = nil
  end
end,
config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end
  }
}})

