lua << END
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Diagnostics
vim.diagnostic.config({
  virtual_text = {
    -- prefix = ' ',
    spacing = 4,
    severity = {
      min = vim.diagnostic.severity.INFO
    }
  },
  update_in_insert = true,
  severity_sort = true
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false
})

-- Show diagnostic when hovering
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

--vim.lsp.set_log_level("trace")


local lsp_status = require('lsp-status')

lsp_status.config({
  kind_labels = vim.g.completion_customize_lsp_label,
  current_function = false,
  status_symbol = '',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})
lsp_status.register_progress()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{ 
  capabilities = capabilities, 
--  on_attach=on_attach,
  on_attach = function(client, bufnr)
--     client.resolved_capabilities.diagnostic = false
     client.resolved_capabilities.document_formatting = false
     client.resolved_capabilities.document_range_formatting = false
     on_attach(client, bufnr)
  end, 
}

lspconfig.tailwindcss.setup {
  on_attach=on_attach,
  capabilities=capabilities,
}

lspconfig.eslint.setup {
  on_attach=on_attach,
  capabilities=capabilities,
  settings={
    format = false,
  }
}

lspconfig.jsonls.setup{ on_attach=on_attach, capabilities = capabilities }
lspconfig.html.setup{ on_attach=on_attach, capabilities = capabilities }
lspconfig.cssls.setup{ on_attach=on_attach, capabilities = capabilities }
-- lspconfig.clojure_lsp.setup{ on_attach=on_attach_vim, capabilities = capabilities }
lspconfig.gopls.setup { on_attach=on_attach, capabilities = capabilities }
lspconfig.sumneko_lua.setup { on_attach=on_attach, capabilities = capabilities }
END
