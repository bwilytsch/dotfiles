return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    config = function()
      local oil = require 'oil'

      oil.setup {
        default_file_explorer = true,
        columns = {
          'icon',
        },
        -- keymaps = {
        --   ["g?"] = "actions.show_help",
        --   ["-"] = "actions.parent",
        --   ["_"] = "actions.open_cwd",
        -- },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name)
            return vim.startswith(name, '.')
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function()
            return false
          end,
          -- Sort file names in a more intuitive order for humans. Is less performant,
          -- so you may want to set to false if you work with large directories.
          natural_order = true,
          -- Sort file and directory names case insensitive
          case_insensitive = false,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { 'type', 'asc' },
            { 'name', 'asc' },
          },
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
