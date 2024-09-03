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
vim.keymap.set('n', 't', function() TerminalMode() end)
vim.keymap.set('v', 't', function() TerminalMode() end)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- NvimTree keybindings
vim.keymap.set('n', '<M-e>', ':NvimTreeOpen<CR>', { silent = true })
vim.keymap.set('v', '<M-e>', ':NvimTreeOpen<CR>', { silent = true })
vim.keymap.set('t', '<M-e>', '<Esc>:NvimTreeOpen<CR>', { silent = true })
vim.keymap.set('i', '<M-e>', '<Esc><Esc>:NvimTreeOpen<CR>', { silent = true })

-- Remove the default keybindings for <BS> (Backspace) and <Del> (Delete)
vim.keymap.set('n', '<BS>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('v', '<BS>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('i', '<BS>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', '<Del>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('v', '<Del>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('i', '<Del>', '<nop>', { noremap = true, silent = true })


-- delete selected text without copying it
vim.keymap.set('n', '<BS>', '"_d', { silent = true })
vim.keymap.set('v', '<BS>', '"_d', { silent = true })
vim.keymap.set('n', '<Del>', '"_d', { silent = true })
vim.keymap.set('v', '<Del>', '"_d', { silent = true })

-- Delete a line without copying it
vim.keymap.set('n', '<BS><BS>', '"_dd', { silent = true })
vim.keymap.set('v', '<BS><BS>', '"_dd', { silent = true })
vim.keymap.set('n', '<Del><Del>', '"_dd', { silent = true })
vim.keymap.set('v', '<Del><Del>', '"_dd', { silent = true })
