return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 99999999, -- Effectively disable auto-popup
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
    win = {
      border = 'rounded',
    },
    spec = {
      { '<leader>c', group = '[C]ode/[C]onfig' },
      { '<leader>d', group = '[D]ocument/[D]iagnostics' },
      { '<leader>g', group = '[G]it/[G]rep' },
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>l', group = '[L]SP' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>t', group = '[T]est' },
      { '<leader>x', group = 'Trouble/Diagnostics' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>s', group = '[S]wap/[S]plit' },
      { '<leader>w', group = '[W]orkspace' },
    },
  },
  keys = {
    { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer keymaps (which-key)' },
  },
}
