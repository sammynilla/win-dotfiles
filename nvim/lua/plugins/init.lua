
local fn = vim.fn
local execute = vim.api.nvim_command

-- bootstrap
local PACKER_BOOTSTRAP = nil
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.delete(install_path, "rf")
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

-- packer in optional requires the use of packadd to function
execute("packadd packer.nvim")

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
  compile_path = fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
})

return packer.startup(function(use)
  use ({ "wbthomason/packer.nvim", opt = true })
  use ({ "lewis6991/impatient.nvim" })

  -- [[ user interface ]] --
  use ({
    "rebelot/kanagawa.nvim", after = "packer.nvim",
    run = function()
      execute("luafile ".. fn.stdpath("config") .. "/lua/colorscheme.lua")
    end,
  })
  use ({ "romgrk/fzy-lua-native" })
  -- use ({ "nixprime/cpsm" })
  use ({
    -- occasionally UpdateRemotePlugins seems to fail? not sure how to get to
    -- work with deferred loading
    "gelguy/wilder.nvim",
    run = function() vim.cmd([[:UpdateRemotePlugins]]) end,
    config = function() require("plugins.configs.wilder") end,
  })

  -- [[ syntax ]] --
  use ({
    "nvim-treesitter/nvim-treesitter", event = { "BufRead", "BufNewFile" },
    run = function() require("plugins.configs.nvim-treesitter") end,
    config = function() require("plugins.configs.nvim-treesitter") end,
  })
  use ({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", })
  use ({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  })
  -- use ({ "nvim-treesitter/playground", after = "nvim-treesitter", })
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
    "norcalli/nvim-colorizer.lua", event = "BufRead",
    config = function() default_package_setup("colorizer") end,
  })
  use ({ -- jump to line numbers
    "nacro90/numb.nvim", event = "CmdlineEnter",
    config = function() default_package_setup("numb") end,
  })
  use ({ "junegunn/limelight.vim", event = "CmdlineEnter", })

  -- [[ lsp ]] --
  use ({
    "williamboman/nvim-lsp-installer", opt = true,
    setup = function()
      require("utils").packer_lazy_load("nvim-lsp-installer")
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd([[if &ft == "packer" | echo "" | else | silent! e %]])
      end, 0)
    end,
  })
  use ({
    "neovim/nvim-lspconfig", after = "nvim-lsp-installer",
    config = function() require("lsp") end
  })

  -- [[ comment ]] --
  use ({ "tpope/vim-commentary", event = "BufRead", })

  -- [[ completion ]] --
  use ({
    "hrsh7th/nvim-cmp", event = "InsertEnter", module = "cmp_nvim_lsp",
    config = function() require("plugins.configs.cmp") end,
  })
  use ({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua", })
  use ({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip", })
  use ({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp", })
  use ({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip", })

  -- [[ snippets ]] --
  use ({ "L3MON4D3/LuaSnip", after = "nvim-cmp", })

  -- [[ git ]] --
  use ({ "tpope/vim-fugitive" })
  -- use ({ "tpope/vim-rhubarb" })
  use ({
    "junegunn/gv.vim", event = "CmdlineEnter",
    requires = { "tpope/vim-fugitive" },
  })
  use ({
    "lewis6991/gitsigns.nvim", opt = true,
    setup = function() require("utils").packer_lazy_load("gitsigns.nvim") end,
    config = function() require("plugins.configs.gitsigns") end,
  })

  -- auto-sync when packer first gets bootstrapped
  if PACKER_BOOTSTRAP ~= nil then
    packer.sync()
    PACKER_BOOTSTRAP = nil
  end
end)

