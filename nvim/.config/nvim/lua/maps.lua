-- Mapping
local keymap =  vim.keymap

-- (n) normal mode, (x) key, (c) command

-- Do not yank with x, just deletes the following character
keymap.set('n', 'x', '"_x')

-- Increment/decrement integers
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'tc', ':tabclose<Return>', { silent = true })

-- Split window
-- Could also be <C-w>s
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
-- Could also be <C-w>v
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Test: Move window
keymap.set('', 'sl', '<C-w>l');
keymap.set('', 'sh', '<C-w>h');
keymap.set('', 'sj', '<C-w>j');
keymap.set('', 'sk', '<C-w>k');

-- Test: Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Move lines (Linux)
keymap.set('n', '<A-j>', ':m+1<CR>==')
keymap.set('n', '<A-k>', ':m-2<CR>==')
keymap.set('v', '<A-j>', ":m'>+1<CR>gv=gv")
keymap.set('v', '<A-k>', ":m'<-2<CR>gv=gv")
