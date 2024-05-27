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
vim.api.nvim_set_keymap('n', 'xx', '"_dd', {})
vim.api.nvim_set_keymap('v', 'xx', '"_dd', {})

-- select all
vim.api.nvim_set_keymap('n', '<M-a>', 'ggVG', {})
vim.api.nvim_set_keymap('i', '<M-a>', 'ggVG', {})

-- prettier
vim.api.nvim_set_keymap('n', '<C-p>', ':Prettier', {})
vim.api.nvim_set_keymap('i', '<C-p>', ':Prettier', {})
vim.api.nvim_set_keymap('v', '<C-p>', ':PrettierFragment', {})
