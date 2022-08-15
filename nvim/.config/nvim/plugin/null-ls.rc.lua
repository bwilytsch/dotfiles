local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
  sources = {
    -- formatting
    null_ls.builtins.formatting.rustywind,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,

    -- diagnostics
    -- @NOTE: Eslint_d doesn't work with certian plugins
    null_ls.builtins.diagnostics.eslint.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    }),

    -- code actions
    -- @NOTE: Eslint_d doesn't work with certian plugins
    null_ls.builtins.code_actions.eslint,
  }
})
