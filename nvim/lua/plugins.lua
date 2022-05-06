
-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local fn = vim.fn

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
  vim.api.nvim_command("packadd packer.nvim")
end

-- auto-compile
local au = require("au")
au.group("PackerGroup", {
  { "BufWritePost", "plugins.lua", "source <afile> | PackerCompile" },
})

require("packer").init({
  autoremove = true, -- remove disabled or unused plugins without a prompt
})

return require("packer").startup({ function(use)
  -- [[ general ]] --
  use ({ "wbthomason/packer.nvim" })
  use ({ "lewis6991/impatient.nvim" })
  -- use ({ "andweeb/presence.nvim" }) -- discord rich presence (VERY SLOW)
  use ({ "dstein64/vim-startuptime" }) -- system profiling
  use ({ "tpope/vim-commentary" }) -- motion based commenting
  use ({ "ntpeters/vim-better-whitespace" }) -- whitespace highlighting
  use ({
    "rktjmp/highlight-current-n.nvim",
    -- run = "",
  })

  -- [[ theming ]] --
  use ({
    "rebelot/kanagawa.nvim", -- color theme
    run = ":luafile lua/colorscheme.lua",
  })
  use ({ "ryanoasis/vim-devicons" })
  use ({
    "crispgm/nvim-tabline",
    config = function()
      local ok, tabline = pcall(require, "tabline")
      if ok then tabline.setup({}) end
    end,
    run = function() require("tabline").setup({}) end,
  })

  -- [[ navigation ]] --
  use ({ "ctrlpvim/ctrlp.vim" }) -- fuzzy finder
  use ({
    "nacro90/numb.nvim", -- jump to line numbers
    config = function()
      local ok, numb = pcall(require, "numb")
      if ok then numb.setup() end
    end,
    run = function() require("numb").setup() end,
  })

  -- [[ git ]] --
  use ({
    "lewis6991/gitsigns.nvim", -- git diff signs
    run = ":luafile lua/plugins/gitsigns.lua",
  })
  use ({ "junegunn/gv.vim", requires = { "tpope/vim-fugitive" }, })

  -- [[ syntax highlighting ]] --
  -- use ({ "nvim-treesitter/nvim-treesitter" })
  -- use ({
  --   "JoosepAlviste/nvim-ts-context-commentstring",
  --   requires = { "nvim-treesitter/nvim-treesitter" },
  -- })
  use ({ "preservim/vim-markdown" })
  use ({ "vim-pandoc/vim-pandoc-syntax" })

  -- [[ text editing ]] --
  -- use ({
  --   "windwp/nvim-ts-autotag",
  --   after = "nvim-treesitter",
  -- })
  use ({
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local ok, autopairs = pcall(require, "nvim-autopairs")
      if ok then autopairs.setup() end
    end,
  })

  -- [[ writing ]] --
  use ({ "ellisonleao/glow.nvim" })
  use ({ "junegunn/limelight.vim" })

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

