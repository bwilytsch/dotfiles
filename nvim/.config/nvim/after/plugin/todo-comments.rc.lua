local status, todos = pcall(require, 'todo-comments')
if (not status) then return end

todos.setup {}

vim.keymap.set('n', 'tt', '<cmd>TodoTelescope<cr>', {})
