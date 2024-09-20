return {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim'
    },
    config = function()
        vim.keymap.set('n', ':', function()
            require("fine-cmdline").open({ default_value = "" })
        end)
    end
}
