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
        vim.cmd('belowright split | terminal')
    else
        vim.cmd(term_win .. 'wincmd w')
    end
    vim.cmd('startinsert')
end


-- Terminal keybindings
vim.api.nvim_set_keymap('n', 't', ':lua TerminalMode()<CR>', {})
vim.api.nvim_set_keymap('v', 't', ':lua TerminalMode()<CR>', {})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})

-- NvimTree keybindings
vim.api.nvim_set_keymap('n', '<M-e>', ':NvimTreeOpen<CR>', {})
vim.api.nvim_set_keymap('v', '<M-e>', ':NvimTreeOpen<CR>', {})
vim.api.nvim_set_keymap('t', '<M-e>', '<Esc>:NvimTreeOpen<CR>', {})
vim.api.nvim_set_keymap('i', '<M-e>', '<Esc><Esc>:NvimTreeOpen<CR>', {})

-- Remove the default keybindings for <BS> (Backspace) and <Del> (Delete)
vim.api.nvim_set_keymap('n', '<BS>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<BS>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<BS>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Del>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Del>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Del>', '<nop>', { noremap = true, silent = true })


-- delete selected text without copying it
vim.api.nvim_set_keymap('n', '<BS>', '"_d', {})
vim.api.nvim_set_keymap('v', '<BS>', '"_d', {})
vim.api.nvim_set_keymap('n', '<BS><BS>', '"_dd', {})
vim.api.nvim_set_keymap('v', '<BS><BS>', '"_dd', {})-- delete without copying to clipboard

-- Delete a line without copying it
vim.api.nvim_set_keymap('n', '<Del>', '"_d', {})
vim.api.nvim_set_keymap('v', '<Del>', '"_d', {})
vim.api.nvim_set_keymap('n', '<Del><Del>', '"_dd', {})
vim.api.nvim_set_keymap('v', '<Del><Del>', '"_dd', {})

-- prettier
vim.api.nvim_set_keymap('n', '<C-p>', ':Prettier<CR>', {})
vim.api.nvim_set_keymap('i', '<C-p>', ':Prettier<CR>', {})
vim.api.nvim_set_keymap('v', '<C-p>', ':PrettierFragment<CR>', {})


