local status, zen_mode = pcall(require, 'zen-mode')
if (not status) then return end

zen_mode.setup {
  width = .85
}

vim.keymap.set('n', '<C-w>z', '<cmd>ZenMode<cr>', { silent = true })
