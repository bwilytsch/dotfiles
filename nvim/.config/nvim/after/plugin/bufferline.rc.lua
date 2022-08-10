local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    numbers = "none",
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    seperator_style = 'thin', -- slant, thick, thin, { 'any', 'any' }
    always_show_bufferline = false,
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_buffer_default_icon = true,
    color_icons = false,
    max_name_length = 10,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
  },
  highlights = {
    separator = {
      -- guifg = '#282828',
      guifg = '#000000',
      guibg = '#000000'
    },
    separator_selected = {
      -- guifg = '#282828',
      guifg = '#000000',
      guibg = '#000000'
    },
    background = {
      guifg = '#3c3836',
      guibg = '#000000'
    },
    buffer_selected = {
      guifg = '#1d2021',
      guibg = '#a89984'
    },
    fill = {
      guifg = "#504945"
    }
  }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
