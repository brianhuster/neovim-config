-- optionally enable 24-bit colour and setting the old color scheme
vim.opt.termguicolors = true
vim.cmd(':colorscheme vim')

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        if vim.bo.buftype == 'terminal' then
            vim.wo.number = false
            vim.o.winheight = 12
            vim.o.number = false
        elseif vim.bo.buftype == 'nofile' then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
        else
            vim.o.winheight = 100
        end
    end
})

vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = function()
        -- Open terminal below the editor buffer, then open Neotree (to the left, by default)
        vim.cmd("belowright split | terminal")
        vim.wo.number = false

        vim.cmd("Neotree")
    end
})
