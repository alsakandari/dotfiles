local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults()

local servers = { "ts_ls", "pyright", "rust_analyzer", "ols" }

if os.getenv("TERMUX_VERSION") then
  table.insert(servers, "clangd")
else
  table.insert(servers, "ccls")
end

vim.lsp.enable(servers)

vim.lsp.config("rust_analyzer", {
  on_init = function() end,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})

vim.diagnostic.config {
  severity_sort = true,
  virtual_text = false,
  virtual_lines = true,
}
