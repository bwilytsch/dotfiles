print('...loading MacOS configuration')

-- Mapping
local keymap =  vim.keymap

keymap.set('n', '∆', ':m+1<CR>==')
keymap.set('n', '˚', ':m-2<CR>==')
keymap.set('v', '∆', ":m'>+1<CR>gv=gv")
keymap.set('v', '˚', ":m'<-2<CR>gv=gv")

-- Clipboard
vim.opt.clipboard:append { 'unnamedplus' }
