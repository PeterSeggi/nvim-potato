local status, _ = pcall(require, "lspconfig")
if not status then
    print("Something went wrong when trying to require lspconfig")
    return
end

require "potato.lsp.config"
-- require("potato.lsp.handler").setup()
require "potato.lsp.uiconfig"
