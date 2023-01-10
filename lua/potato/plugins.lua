local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer. Close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Something went wrong with packer. Check the config")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)

    -- General purpose plugins go here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "numToStr/Comment.nvim" -- Comment plugin
    use "windwp/nvim-autopairs" -- Autopairs for {([])}

    -- Colorschemes
    use "EdenEast/nightfox.nvim" -- Nightfox colorscheme
    use 'folke/tokyonight.nvim' -- Tokyonight colorscheme
    use "ellisonleao/gruvbox.nvim" -- gruvbox colorscheme

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-nvim-lsp" -- lsp completion

    -- snippet plugins
    use "L3MON4D3/LuaSnip" -- main snip plugins
    use "saadparwaiz1/cmp_luasnip" -- snippet completitions
    use "rafamadriz/friendly-snippets" -- various snippets

    -- lsp provider
    use "neovim/nvim-lspconfig" -- lsp provider
    use "williamboman/mason.nvim" -- lsp installer
    use "williamboman/mason-lspconfig.nvim" -- bridge between mason and lspconfig

    -- Telescope
    use "nvim-telescope/telescope.nvim" -- Telescope!

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)
