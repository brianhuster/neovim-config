local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        lazy = false
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    "nvim-tree/nvim-tree.lua",
    'nvim-tree/nvim-web-devicons',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    {"neoclide/coc.nvim", branch="release"},
    "github/copilot.vim",
    'numToStr/Comment.nvim',
    {"prettier/vim-prettier", run="npm install --frozen-lockfile --production"},
})

require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
  }

vim.cmd(':colorscheme vim')
vim.cmd(':TSInstall lua')
vim.cmd(':syntax on')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

vim.cmd([[
  autocmd VimEnter * execute "belowright split | terminal" | NvimTreeOpen
]])

vim.g['airline_powerline_fonts'] = 1
vim.g['airline_theme'] = 'simple'
vim.g['airline_section_b'] = '%{expand("%:t")}'

-- Configure Coc
-- Keybindings for Coc
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true})
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})
vim.api.nvim_set_keymap('n', '<space>s', ':<C-u>CocList -I symbols<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<space>d', ':<C-u>CocList diagnostics<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>do', '<Plug>(coc-codeaction)', {})
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- Add the language packs for coc
vim.g.coc_global_extensions = {
  'coc-tsserver',
  'coc-json',
  'coc-css',
  'coc-eslint',
  'coc-prettier',
  'coc-python',
  'coc-pyright',
  'coc-clangd',
  'coc-html',
  'coc-lua'
}

function TerminalMode()
    local buf = vim.api.nvim_get_current_buf()
    if vim.fn.getbufvar(buf, '&buftype') == 'terminal' then
        vim.cmd('startinsert')
        return
    end
    local term_win = -1
    for win = 1, vim.fn.winnr('$') do
        local buf = vim.fn.winbufnr(win)
        if vim.fn.getbufvar(buf, '&buftype') == 'terminal' then
            term_win = win
            break
        end
    end
    if term_win == -1 then
        vim.cmd('split | terminal')
    else
        vim.cmd(term_win .. 'wincmd w')
    end
    vim.cmd('startinsert')
end

-- Terminal keybindings
vim.api.nvim_set_keymap('n', '<M-t>', ':lua TerminalMode()<CR>', {})
vim.api.nvim_set_keymap('i', '<M-t>', ':lua TerminalMode()<CR>', {})
vim.api.nvim_set_keymap('v', '<M-t>', ':lua TerminalMode()<CR>', {})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})

-- delete without copying to clipboard
vim.api.nvim_set_keymap('n', 'x', '"_d', {})
vim.api.nvim_set_keymap('v', 'x', '"_d', {})

-- select all
vim.api.nvim_set_keymap('n', '<M-a>', 'ggVG', {})
vim.api.nvim_set_keymap('i', '<M-a>', 'ggVG', {})

-- prettier
vim.api.nvim_set_keymap('n', '<C-p>', ':Prettier', {})
vim.api.nvim_set_keymap('i', '<C-p>', ':Prettier', {})
vim.api.nvim_set_keymap('v', '<C-p>', ':PrettierFragment', {})

-- General settings
vim.o.mouse = 'a'
vim.o.number = true
vim.o.hidden = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.encoding = 'utf8'
vim.o.history = 5000
vim.o.clipboard = 'unnamedplus'
vim.o.autowriteall = true -- set autosave
