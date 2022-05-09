
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
    if config ~= nil then
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
  use ({ "rebelot/kanagawa.nvim", run = ":luafile lua/colorscheme.lua", })
  use ({
    "crispgm/nvim-tabline",
    config = function() default_package_setup("tabline", {}) end,
  })
  use ({ -- popup menu
    "gelguy/wilder.nvim", event = "CmdlineEnter",
    config = function() require("plugins.configs.wilder") end,
  })

  -- [[ comment ]] --
  use ({ "tpope/vim-commentary", event = "BufRead", })

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
  use ({
    "preservim/vim-markdown",
    config = function() require("plugins.configs.markdown") end,
  })
  use ({ "vim-pandoc/vim-pandoc-syntax" })

  -- [[ utilities ]] --
  use ({ "dstein64/vim-startuptime" })
  use ({ "ntpeters/vim-better-whitespace" })
  use ({ "rktjmp/highlight-current-n.nvim", event = "CmdlineEnter", })
  use ({
    "windwp/nvim-autopairs", event = "InsertEnter",
    config = function() default_package_setup("nvim-autopairs", nil) end,
  })

  use ({ -- TODO: look over the configurations for this
    "norcalli/nvim-colorizer.lua", event = "BufEnter",
    config = function() default_package_setup("colorizer", nil) end,
  })
  use ({
    "ctrlpvim/ctrlp.vim",
    config = function() require("plugins.configs.ctrlp") end,
  })
  use ({ -- jump to line numbers
    "nacro90/numb.nvim", event = "CmdlineEnter",
    config = function() require("numb").setup() end,
  })
  use ({ "junegunn/limelight.vim", event = "CmdlineEnter", })

  -- [[ lsp and autocompletion ]] --
  -- use ({
  --   "williamboman/nvim-lsp-installer",
  --   config = function()
  --     local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
  --     if ok then
  --       lsp_installer.setup({
  --         ensure_installed = {
  --           "bashls",
  --           "sumneko_lua",
  --           "cssls",
  --           "html",
  --           "jsonls",
  --         },
  --         -- automatic_installation = true,
  --         ui = {
  --           icons = {
  --             server_installed = "✓",
  --             server_pending = "➜",
  --             server_uninstalled = "✗"
  --           }
  --         }
  --       })
  --     end
  --   end,
  -- })
  -- use ({
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     local runtime_path = vim.split(package.path, ";")
  --     table.insert(runtime_path, "lua/?.lua")
  --     table.insert(runtime_path, "lua/?/init.lua")
  --     require("lspconfig").sumneko_lua.setup({
  --       settings = {
  --         Lua = {
  --           runtime = { version = "LuaJIT", path = runtime_path, },
  --           diagnostics = { globals = { "vim", }, },
  --           workspace = { library = vim.api.nvim_get_runtime_file("", true), },
  --           telemetry = { enable = false, },
  --         }
  --       }
  --     })
  --   end,
  -- })

  -- [[ git ]] --
  use ({
    "lewis6991/gitsigns.nvim", event = "BufRead",
    config = function() require("plugins.configs.gitsigns") end,
  })
  use ({
    "junegunn/gv.vim", event = "CmdlineEnter",
    requires = { "tpope/vim-fugitive" },
  })

  -- auto-sync if first time running.
  if PACKER_BOOTSTRAP ~= nil then
    packer.sync()
    PACKER_BOOTSTRAP = nil
  end
end)

