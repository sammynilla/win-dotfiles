
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
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
  group = vim.api.nvim_create_augroup("Packer", { clear = true, }),
})

require("packer").init({
  autoremove = true, -- remove disabled or unused plugins without a prompt
})

return require("packer").startup({ function(use)
  -- [[ general ]] --
  use ({ "wbthomason/packer.nvim" })
  use ({ "lewis6991/impatient.nvim" })
  use ({ "dstein64/vim-startuptime" }) -- system profiling
  use ({ -- motion based commenting
    "tpope/vim-commentary",
    event = "BufRead",
  })
  use ({ "ntpeters/vim-better-whitespace" }) -- whitespace highlighting
  use ({ "rktjmp/highlight-current-n.nvim" })

  -- [[ theming ]] --
  use ({
    "rebelot/kanagawa.nvim", -- color theme
    run = ":luafile lua/colorscheme.lua",
  })
  use ({
    "crispgm/nvim-tabline", -- tabline
    config = function()
      local ok, tabline = pcall(require, "tabline")
      if ok then tabline.setup({}) end
    end,
  })
  use ({
    "gelguy/wilder.nvim", -- popup menu
    event = "CmdlineEnter",
    config = function() require("plugins.wilder") end,
  })

  -- [[ navigation ]] --
  use ({ "ctrlpvim/ctrlp.vim" }) -- fuzzy finder
  use ({
    "nacro90/numb.nvim", -- jump to line numbers
    event = "CmdlineEnter",
    config = function()
      local ok, numb = pcall(require, "numb")
      if ok then numb.setup() end
    end,
  })

  -- [[ git ]] --
  use ({
    "lewis6991/gitsigns.nvim", -- git diff signs
    run = ":luafile lua/plugins/gitsigns.lua",
  })
  use ({
    "junegunn/gv.vim",
    event = "CmdlineEnter",
    requires = { "tpope/vim-fugitive" },
  })

  -- [[ syntax highlighting ]] --
  use ({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function() require("plugins.nvim-treesitter") end,
    run = function() require("plugins.nvim-treesitter") end,
  })
  use ({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  })
  use ({ "preservim/vim-markdown" })
  use ({ "vim-pandoc/vim-pandoc-syntax" })

  -- [[ lsp and autocompletion ]] --
  use ({
    "neovim/nvim-lspconfig",
    config = function()
      local runtime_path = vim.split(package.path, ";")
      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")
      require("lspconfig").sumneko_lua.setup({
        settings = {
          Lua = {
            runtime = { version = "LuaJIT", path = runtime_path, },
            diagnostics = { globals = { "vim", }, },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), },
            telemetry = { enable = false, },
          }
        }
      })
    end,
  })
  use ({
    "williamboman/nvim-lsp-installer",
    config = function()
      local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
      if ok then
        lsp_installer.setup({
          ensure_installed = { "sumneko_lua", },
          -- automatic_installation = true,
          ui = {
            icons = {
              server_installed = "✓",
              server_pending = "➜",
              server_uninstalled = "✗"
            }
          }
        })
      end
    end,
  })

  -- [[ text editing ]] --
  use ({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", })
  use ({
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local ok, autopairs = pcall(require, "nvim-autopairs")
      if ok then autopairs.setup() end
    end,
  })

  -- [[ writing ]] --
  use ({ "junegunn/limelight.vim", event = "CmdlineEnter", })

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

