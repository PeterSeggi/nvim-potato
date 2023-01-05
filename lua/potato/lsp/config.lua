local servers = {
  "sumneko_lua",
  "pyright",
  "clangd",
  "rust_analyzer"
}


require("mason").setup({
    ui = {
      border = "none",
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
    },
    max_concurrent_installers = 4,
})

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  print("Something went wrong requiring lspconfig inside lspconfig.lua")
  return
end

for _, lsp in ipairs(servers) do

  lspconfig[lsp].setup {
    on_attach = require("potato.lsp.handler").on_attach,
    capabilities = require("potato.lsp.handler").capabilities
  }
end
