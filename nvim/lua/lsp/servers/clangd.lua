local _M = {}
_M.setup = function(on_attach, capabilities)
  require("lspconfig").clangd.setup({})
end

return _M
