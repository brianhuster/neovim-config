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
    {
        "neoclide/coc.nvim", 
        branch="release"
    },
    "github/copilot.vim",
    'numToStr/Comment.nvim',
    {
        "prettier/vim-prettier", 
        run="npm install --frozen-lockfile --production"
    },
})

-- disable netrw to avoid conflicts with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Nvim-tree
require("nvim-tree").setup()

-- Nvim-treesitter
require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,              
    },
}
local parser_list = require'nvim-treesitter.parsers'.available_parsers()
if not vim.tbl_contains(parser_list, 'lua') then
    vim.cmd(':TSInstall lua')
end

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

-- vim-airline
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_theme'] = 'simple'
vim.g['airline_section_b'] = '%{expand("%:t")}'