local settings = {
  filetypes = { "c", "cpp" }
}

local _M = {}
_M.setup = function(on_attach, capabilities)
  require("lspconfig").clangd.setup({
    settings = settings,
    capabilities = capabilities,
  })
end

return _M
