return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function ()
        require('mason').setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        require("mason-lspconfig").setup {
            ensure_installed = {
                "arduino_language_server",
                "bashls",
                "clangd",
                "cssls",
                "tailwindcss",
                "dockerls",
                "html",
                "tsserver",
                "jsonls",
                "lua_ls",
                "marksman",
                "phpactor",
                "pyright",
                "volar",
            },
        }
        require("lspconfig").arduino_language_server.setup{}
        require('lspconfig').bashls.setup{}
        require('lspconfig').clangd.setup{}
        require('lspconfig').cssls.setup{}
        require('lspconfig').tailwindcss.setup{}
        require('lspconfig').dockerls.setup{}
        require('lspconfig').html.setup{}
        require('lspconfig').tsserver.setup{}
        require('lspconfig').jsonls.setup{}
        require('lspconfig').lua_ls.setup{}
        require('lspconfig').marksman.setup{}
        require('lspconfig').phpactor.setup{}
        require('lspconfig').pyright.setup{}
        require('lspconfig').volar.setup{}
    end,
}