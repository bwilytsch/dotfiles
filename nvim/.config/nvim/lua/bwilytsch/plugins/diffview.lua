return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    -- Open diffview
    { '<leader>gdo', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iffview [O]pen' },
    { '<leader>gdc', '<cmd>DiffviewClose<cr>', desc = '[G]it [D]iffview [C]lose' },
    { '<leader>gdf', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [D]iffview [F]ile history' },
    { '<leader>gdh', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [D]iffview [H]istory for current file' },
    { '<leader>gdt', '<cmd>DiffviewToggleFiles<cr>', desc = '[G]it [D]iffview [T]oggle files' },
  },
  opts = {
    diff_binaries = false,
    enhanced_diff_hl = true,
    git_cmd = { 'git' },
    use_icons = true,
    show_help_hints = true,
    watch_index = true,
    icons = {
      folder_closed = '📁',
      folder_open = '📂',
    },
    signs = {
      fold_closed = '▶',
      fold_open = '▼',
      done = '✓',
    },
    keymaps = {
      -- Disable defaults and only keep non-conflicting keymaps
      -- This ensures your window navigation (sl, sh, sj, sk) works in diffview
      disable_defaults = true,
      view = {
        ['q'] = '<cmd>DiffviewClose<cr>',
      },
      file_panel = {
        -- Use arrow keys for navigation (won't conflict with your 's' prefix)
        ['<down>'] = 'next_entry',
        ['<up>'] = 'prev_entry',
        ['<cr>'] = 'select_entry',
        ['o'] = 'open_entry',
        ['q'] = '<cmd>DiffviewClose<cr>',
        -- Essential functionality with non-conflicting keys
        ['-'] = 'toggle_stage_entry',
        ['<leader>sa'] = 'stage_all', -- Stage all (using <leader>sa to avoid 's' conflict)
        ['<leader>ua'] = 'unstage_all', -- Unstage all
      },
      file_history_panel = {
        ['q'] = '<cmd>DiffviewClose<cr>',
      },
    },
    view = {
      -- Default view options
      merge_tool = {
        layout = 'diff3_mixed',
        disable_diagnostics = true,
      },
      file_history = {
        layout = 'diff2_horizontal',
      },
    },
  },
  config = function(_, opts)
    require('diffview').setup(opts)

    -- Diff highlighting with muted colors
    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#1a3327' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#55252a' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#4d4422' })
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#4d4422' })

    -- Re-apply after colorscheme changes
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#1a3327' })
        vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#55252a' })
        vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#4d4422' })
        vim.api.nvim_set_hl(0, 'DiffText', { bg = '#4d4422' })
      end,
    })

    -- Ensure syntax highlighting in diffview panes
    vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
      callback = function()
        if vim.wo.diff then
          vim.opt_local.syntax = 'on'
          if vim.bo.filetype == '' then
            vim.cmd('filetype detect')
          end
        end
      end,
    })
  end,
}
