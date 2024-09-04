-- Vô hiệu hóa các plugin mặc định không cần thiết trong Neovim
local disabled_built_ins = {
    "2html_plugin",
    "tohtml",
    "getscript",
    "getscriptPlugin",
    "logipat",
    "matchit",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "tutor",
    "rplugin",
    "compiler",
    "bugreport",
    "ftplugin",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- General settings
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.history = 5000
vim.opt.clipboard = 'unnamedplus'
vim.opt.autowriteall = true -- set autosave
vim.opt.modeline = false
vim.g.mapleader = ' '
vim.cmd([[autocmd BufRead,BufNewFile *.ejs set filetype=html]])
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        vim.cmd('set number')
    end
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.cmd('TSBufEnable highlight')
    end
})
