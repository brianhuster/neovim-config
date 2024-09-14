-- optionally enable 24-bit colour and setting the old color scheme
vim.opt.termguicolors = true
vim.cmd(':colorscheme vim')
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1e1e1e', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1e1e1e', fg = '#ff79c6' })

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        if vim.bo.buftype == 'terminal' then
            vim.wo.number = false
            vim.o.winheight = 12
        elseif vim.bo.buftype == 'nofile' then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
        else
            vim.o.winheight = 100
        end
    end
})
