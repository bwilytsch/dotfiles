local status, typescript = pcall(require, 'typescript')
if (not status) then return end

typescript.setup({
  disable_commands = false,
  debug = false,
  server = {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
  }
})
