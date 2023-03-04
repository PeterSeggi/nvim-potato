local servers = {
    "lua_ls",
    "pyright",
    "clangd",
    "rust_analyzer",
    "lemminx",
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

    local settings_special = {}

    local set_status, set = pcall(require, "potato.lsp.settings." .. lsp)
    if set_status then
        settings_special = set
    end

    lspconfig[lsp].setup {
        on_attach = require("potato.lsp.handler").on_attach,
        capabilities = require("potato.lsp.handler").capabilities,
        settings = settings_special
    }
end
