vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Custom Keymaps
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { silent = true })
-- Disable VIM record
-- vim.keymap.set('', 'q', '<Nop>')
-- Character operations
vim.keymap.set('n', 'x', '"_x') -- Delete without yanking
-- Number operations
vim.keymap.set('n', '+', '<C-a>') -- Increment
vim.keymap.set('n', '-', '<C-x>') -- Decrement
-- Window management
vim.keymap.set('n', 'ss', ':split<CR><C-w>w', { silent = true, desc = 'Split horizontally', noremap = true })
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true, desc = 'Split vertically', noremap = true })
-- Window navigation
vim.keymap.set('n', 'sl', '<C-w>l', { noremap = true })
vim.keymap.set('n', 'sh', '<C-w>h', { noremap = true })
vim.keymap.set('n', 'sj', '<C-w>j', { noremap = true })
vim.keymap.set('n', 'sk', '<C-w>k', { noremap = true })
-- Line movement in visual mode
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Kickstart keyamaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
