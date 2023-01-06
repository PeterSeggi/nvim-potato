local opts = { noremap = true, silent = true }

local settings = {
  clangd = {
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]],
    vim.api.nvim_set_keymap("n", "<space>h", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
  },
}

return settings
