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
vim.api.nvim_set_keymap('n', 't', ':lua TerminalMode()<CR>', {})
vim.api.nvim_set_keymap('v', 't', ':lua TerminalMode()<CR>', {})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})

-- delete without copying to clipboard
vim.api.nvim_set_keymap('n', '<BS>', '"_d', {})
vim.api.nvim_set_keymap('v', '<BS>', '"_d', {})
vim.api.nvim_set_keymap('n', '<BS>', '"_dd', {})
vim.api.nvim_set_keymap('v', '<BS><BS>', '"_dd', {})
vim.api.nvim_set_keymap('n', '<Del>', '"_d', {})
vim.api.nvim_set_keymap('v', '<Del>', '"_d', {})
vim.api.nvim_set_keymap('n', '<Del>', '"_dd', {})
vim.api.nvim_set_keymap('v', '<Del><Del>', '"_dd', {})

-- prettier
vim.api.nvim_set_keymap('n', '<C-p>', ':Prettier<CR>', {})
vim.api.nvim_set_keymap('i', '<C-p>', ':Prettier<CR>', {})
vim.api.nvim_set_keymap('v', '<C-p>', ':PrettierFragment<CR>', {})


