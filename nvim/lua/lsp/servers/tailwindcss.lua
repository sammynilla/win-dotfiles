local _M = {}
_M.setup = function(on_attach, capabilities)
  require("lspconfig").tailwindcss.setup({ })
end

return _M
