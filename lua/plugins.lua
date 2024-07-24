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
        run="npm install --frozen-lockfile --production",
    },
    {
        'brianhuster/live-preview.nvim',
        run = 'npm install && npm install -g nodemon',
        config = function()
            require('live-preview')
            vim.api.nvim_create_user_command('LivePreview', function()
                require('live-preview').preview_file()
            end, {})
            vim.api.nvim_create_user_command('StopPreview', function()
                require('live-preview').stop_preview()
            end, {})
        end,
    }
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
parsers = {'lua', 'python', 'html', 'css', 'json', 'javascript', 'typescript', 'c', 'cpp', 'rust', 'go', 'bash', 'yaml', 'toml', 'graphql', 'php', 'java', 'kotlin', 'ruby', 'rust', 'scss', 'tsx', 'vue', 'svelte', 'swift', 'bash'}

for _, parser in pairs(parsers) do
    if not vim.tbl_contains(parser_list, parser) then
        vim.cmd(':TSInstall ' .. parser)
    end
end

-- Add the language packs for coc
vim.g.coc_global_extensions = {
    'coc-tsserver',
    'coc-json',
    'coc-css',
    'coc-eslint',
    'coc-prettier',
    'coc-python',
    'coc-clangd',
    'coc-html',
    'coc-lua'
  }

-- vim-airline
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_theme'] = 'light'
vim.g['airline_section_b'] = '%{expand("%:t")}'
