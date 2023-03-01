local opts = { noremap = true, silent = true }

local settings = {
    c = {
        -- I think that this was an attempt at formatting C, leave it commented unless you *know* what youre doing
        -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]],
        vim.api.nvim_set_keymap("n", "<space>h", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
    },
}

return settings
