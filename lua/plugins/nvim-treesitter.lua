return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = false,
    config = function ()
        require'nvim-treesitter.configs'.setup {
            highlight = {
              enable = true,              
            },
        }

        local parser_list = require'nvim-treesitter.parsers'.available_parsers()
        local parsers = {'lua', 'python', 'html', 'css', 'json', 'javascript', 'typescript', 'c', 'cpp', 'rust', 'go', 'bash', 'yaml', 'toml', 'graphql', 'php', 'java', 'kotlin', 'ruby', 'scss', 'tsx', 'vue', 'svelte', 'swift', 'bash', 'embedded_template'}

        for _, parser in pairs(parsers) do
            if not vim.tbl_contains(parser_list, parser) then
                vim.cmd(':TSInstall ' .. parser)
            end
        end

    end
}

