return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        go = { 'gofmt', 'goimports' },
        zig = { 'zig fmt' },
        -- Conform will run the first available formatter
        javascript = { 'biome-check', 'biome-organize-imports', 'biome' },
        javascriptreact = { 'biome-check', 'biome-organize-imports', 'biome' },
        typescript = { 'biome-check', 'biome-organize-imports', 'biome' },
        typescriptreact = { 'biome-check', 'biome-organize-imports', 'biome' },
        -- javascript = { 'biome-check', 'biome-organize-imports', 'biome', 'prettierd', 'prettier', stop_after_first = true },
        -- javascriptreact = { 'biome-check', 'biome-organize-imports', 'biome', 'prettierd', 'prettier', stop_after_first = true },
        -- typescript = { 'biome-check', 'biome-organize-imports', 'biome', 'prettierd', 'prettier', stop_after_first = true },
        -- typescriptreact = { 'biome-check', 'biome-organize-imports', 'biome', 'prettierd', 'prettier', stop_after_first = true },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
      },
      notify_on_error = true,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    }
  end,
}
