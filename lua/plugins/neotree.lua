local function neotree_keybindings()
    -- NvimTree keybindings
    vim.keymap.set('n', '<M-e>', ':Neotree toggle<CR>', { silent = true })
    vim.keymap.set('v', '<M-e>', ':Neotree toggle<CR>', { silent = true })
    vim.keymap.set('t', '<M-e>', '<Esc><Esc>:Neotree toggle<CR>', { silent = true })
    vim.keymap.set('i', '<M-e>', '<C-\\><C-n>:Neotree toggle<CR>', { silent = true })
end

local function neotree_autocmd()
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
            if vim.bo.buftype ~= "nofile" then
                vim.cmd("Neotree close")
            end
        end
    })
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim"
    },
    config = function()
        neotree_keybindings()
        neotree_autocmd()
        require('neo-tree').setup({
            filesystem = {
                filtered_items = {
                    visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
        })
    end,
}
