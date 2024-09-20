return {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim'
    },
    config = function()
        vim.keymap.set('n', ':',
            require("fine-cmdline").open({ default_value = "" })
        )
    end
}
