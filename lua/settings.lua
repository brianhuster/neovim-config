-- Vô hiệu hóa các plugin mặc định không cần thiết trong Neovim
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
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
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end


-- Set up the use of ibus in neovim
-- Define global variable to store the previous IBus engine
_G.ibus_prev_engine = ""

-- Function to turn off IBus (switch to English)
function IBusOff()
    -- Save the current engine
    _G.ibus_prev_engine = vim.fn.system('ibus engine')
    -- Switch to English engine
    os.execute('ibus engine xkb:us::eng')
end

-- Function to turn on IBus (restore the previous engine)
function IBusOn()
    local current_engine = vim.fn.system('ibus engine')
    -- If the engine was not set to English in normal mode,
    -- save the current engine to restore it later
    if not string.find(current_engine, 'xkb:us::eng') then
        _G.ibus_prev_engine = current_engine
    end
    -- Restore the previous engine
    os.execute('ibus engine ' .. _G.ibus_prev_engine)
end

vim.api.nvim_create_augroup("IBusHandler", { clear = true })
vim.api.nvim_create_autocmd({ "CmdLineEnter" }, {
    pattern = "[/?]",
    callback = IBusOn,
    group = "IBusHandler",
})
vim.api.nvim_create_autocmd({ "CmdLineLeave" }, {
    pattern = "[/?]",
    callback = IBusOff,
    group = "IBusHandler",
})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = "*",
    callback = IBusOn,
    group = "IBusHandler",
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = IBusOff,
    group = "IBusHandler",
})


IBusOff()

-- General settings
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.encoding = 'utf8'
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
