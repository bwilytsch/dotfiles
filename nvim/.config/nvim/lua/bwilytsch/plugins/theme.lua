return {
  'Mofiqul/dracula.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'dracula'

    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

    vim.diagnostic.config {
      show_header = false,
      float = { border = 'rounded' },
    }
  end,
  opts = {
    transparent_bg = true,
    italic_comment = true,
  },
}
