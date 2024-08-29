
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
vim.api.nvim_create_autocmd({"CmdLineEnter"}, {
  pattern = "[/?]",
  callback = IBusOn,
  group = "IBusHandler",
})
vim.api.nvim_create_autocmd({"CmdLineLeave"}, {
  pattern = "[/?]",
  callback = IBusOff,
  group = "IBusHandler",
})
vim.api.nvim_create_autocmd({"InsertEnter"}, {
  pattern = "*",
  callback = IBusOn,
  group = "IBusHandler",
})
vim.api.nvim_create_autocmd({"InsertLeave"}, {
  pattern = "*",
  callback = IBusOff,
  group = "IBusHandler",
})

IBusOff()

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
vim.opt.modeline = false
vim.g.mapleader = ' '
