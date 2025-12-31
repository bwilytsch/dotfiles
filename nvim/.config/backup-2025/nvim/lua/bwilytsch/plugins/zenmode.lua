return {
  {
    'folke/zen-mode.nvim',
    config = function()
      vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { silent = true })
    end,
    opts = {
      {
        width = 0.85,
        options = {
          number = true,
        },
        plugins = {
          tmux = { enabled = true },
          kitty = {
            enabled = true,
            font = '+4',
          },
        },
      },
    },
  },
}
