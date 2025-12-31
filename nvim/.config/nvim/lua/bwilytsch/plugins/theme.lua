return {
  {
    'Mofiqul/dracula.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'dracula'

      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'CmpNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

      vim.diagnostic.config {
        show_header = false,
        float = { border = 'rounded' },
      }

      -- Diff highlighting with muted colors
      vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#1a3327' })
      vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#55252a' })
      vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#4d4422' })
      vim.api.nvim_set_hl(0, 'DiffText', { bg = '#4d4422' })
    end,
    opts = {
      transparent_bg = true,
      italic_comment = true,
    },
  },
  {
    'folke/noice.nvim',
    opts = {
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = true,
        },
        -- override markdown rendering so that plugins use Treesitter
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
        message = {
          enabled = false,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
}
