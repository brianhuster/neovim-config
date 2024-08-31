function bufEnter()
    if vim.bo.buftype == 'terminal' then
        vim.wo.number = false
        vim.o.winheight = 12
        vim.o.number=false
    elseif vim.bo.buftype == 'nofile' then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
    else
        vim.o.winheight = 100
    end
    if vim.bo.filetype ~= 'NvimTree' then
        vim.cmd("NvimTreeClose")
    end
end

function VimEnter()
    -- set up terminal when opening nvim
    vim.cmd("belowright split | terminal")
    vim.wo.number = false

    -- open NvimTree
    vim.cmd("NvimTreeOpen")
end

-- optionally enable 24-bit colour and setting the old color scheme
vim.opt.termguicolors = true
vim.cmd(':colorscheme vim')

vim.cmd([[
    autocmd VimEnter * lua VimEnter()
    autocmd BufEnter * lua bufEnter()
]])


