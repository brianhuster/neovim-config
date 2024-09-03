return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client.supports_method('textDocument/implementation') then
                    -- Create a keymap for vim.lsp.buf.implementation
                    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
                end
                if client.supports_method('textDocument/completion') and vim.lsp.completion then
                    -- Enable auto-completion
                    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
                end
                if client.supports_method('textDocument/formatting') then
                    -- Format the current buffer on save
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end,
                    })
                end
            end,
        })
    end
}