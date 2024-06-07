function bufEnter()
    if vim.bo.buftype == 'terminal' then
        vim.wo.number = false
        vim.o.winheight = 11
    elseif vim.bo.buftype == 'NvimTree' then
        vim.o.winheight = 100
        vim.cmd("autocmd BufEnter NvimTree normal")
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

-- General settings
vim.o.mouse = 'a'
vim.o.number = true
vim.o.hidden = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cursorline = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.encoding = 'utf8'
vim.o.history = 5000
vim.o.clipboard = 'unnamedplus'
vim.o.autowriteall = true -- set autosave
