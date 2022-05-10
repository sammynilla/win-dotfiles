
local utils = require("utils")

local servers = { "sumneko_lua", }

require("nvim-lsp-installer").setup({
  ensure_installed = servers,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local on_attach = function(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require("lsp.servers."..lsp).setup(on_attach, capabilities)
end

for type, icon in pairs(utils.signs) do
  local hl = "DiagnosticSign"..type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
