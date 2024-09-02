return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function ()
        local lang_servers = {
            "arduino_language_server",
            "bashls",
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
        }
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
            ensure_installed = lang_servers,
        }
        for _, lsp in ipairs(lang_servers) do
            require('lspconfig')[lsp].setup {}
        end
        require('lspconfig').ccls = {}
    end,
}