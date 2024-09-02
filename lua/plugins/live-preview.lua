return {
        'brianhuster/live-preview.nvim',
        branch = "dev",
        build = 'npm install && npm install -g nodemon',
        ft = {'html', 'md', 'markdown'},
        opts = {},
    }
