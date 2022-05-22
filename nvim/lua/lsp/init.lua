local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

local server_list = { "clangd", "sumneko_lua", "tailwindcss", }
lsp_installer.setup({
  servers = server_list,
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "⧖",
      server_uninstalled = "✗"
    }
  }
})

local on_attach = function(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- https://github.com/williamboman/nvim-lsp-installer/discussions/636
for _, lsp in ipairs(server_list) do
  require("lsp.servers." .. lsp).setup(on_attach, capabilities)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- virtual_text = false,
    -- signs = true,
    -- update_in_insert = true,
  }
)

local utils = require("utils")
for type, icon in pairs(utils.signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
