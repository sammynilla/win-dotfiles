
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

-- handle edge-case where initial startup happens without a connection
local ok, packer = pcall(require, "packer")
if not ok then
  return
end

function default_package_setup(package_id, config)
  local ok, package = pcall(require, package_id)
  if ok then
    if config then
      package.setup(config)
      return
    end
    package.setup()
  end
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  git = { clone_timeout = 600, },
  autoremove = true, -- remove disabled or unused plugins without a prompt
  -- compile_on_sync = false,
})

return packer.startup(function(use)
  use ({ "wbthomason/packer.nvim" })
  use ({ "lewis6991/impatient.nvim" })

  -- [[ user interface ]] --
  use ({
    "rebelot/kanagawa.nvim", as = "colorscheme",
    run = ":luafile lua/colorscheme.lua",
  })
  use ({
    "crispgm/nvim-tabline", after = "colorscheme",
    config = function() default_package_setup("tabline", {}) end,
  })
  use ({ -- popup menu
    "gelguy/wilder.nvim", event = "CmdlineEnter",
    config = function() require("plugins.configs.wilder") end,
  })
  -- use ({
  --   "karb94/neoscroll.nvim",
  --   config = function() default_package_setup("neoscroll", nil) end,
  -- })

  -- [[ syntax ]] --
  use ({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function() require("plugins.configs.nvim-treesitter") end,
    run = function() require("plugins.configs.nvim-treesitter") end,
  })
  use ({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", })
  use ({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  })
  use ({ "nvim-treesitter/playground", after = "nvim-treesitter", })
  use ({
    "preservim/vim-markdown",
    config = function() require("plugins.configs.markdown") end,
  })
  use ({ "vim-pandoc/vim-pandoc-syntax" })

  -- [[ utilities ]] --
  use ({ "rktjmp/highlight-current-n.nvim", event = "CmdlineEnter", })
  use ({
    "windwp/nvim-autopairs", event = "InsertEnter",
    config = function() default_package_setup("nvim-autopairs") end,
  })
  use ({ -- TODO: look over the configurations for this
    "norcalli/nvim-colorizer.lua", event = "BufEnter",
    config = function() default_package_setup("colorizer") end,
  })
  use ({
    "ctrlpvim/ctrlp.vim",
    config = function() require("plugins.configs.ctrlp") end,
  })
  use ({ -- jump to line numbers
    "nacro90/numb.nvim", event = "CmdlineEnter",
    config = function() default_package_setup("numb") end,
  })
  use ({ "junegunn/limelight.vim", event = "CmdlineEnter", })

  -- [[ lsp ]] --
  use ({ "williamboman/nvim-lsp-installer" })
  use ({ "neovim/nvim-lspconfig" })

  -- [[ comment ]] --
  use ({ "tpope/vim-commentary", event = "BufRead", })

  -- [[ completion ]] --
  use ({
    "hrsh7th/nvim-cmp",
    config = function() require("plugins.configs.cmp") end,
  })
  use ({ "hrsh7th/cmp-nvim-lsp" })
  use ({ "saadparwaiz1/cmp_luasnip" })

  -- [[ snippets ]] --
  use ({ "L3MON4D3/LuaSnip" })

  -- [[ git ]] --
  use ({ "tpope/vim-fugitive" })
  use ({ "tpope/vim-rhubarb" })
  use ({
    "junegunn/gv.vim", event = "CmdlineEnter",
    requires = { "tpope/vim-fugitive" },
  })
  use ({
    "lewis6991/gitsigns.nvim", event = "BufRead",
    config = function() require("plugins.configs.gitsigns") end,
  })

  -- auto-sync when packer first gets bootstrapped
  if PACKER_BOOTSTRAP ~= nil then
    packer.sync()
    PACKER_BOOTSTRAP = nil
  end
end)

