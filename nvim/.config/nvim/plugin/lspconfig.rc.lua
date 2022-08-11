local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescriptreact", "typescript.tsx" },
}

nvim_lsp.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javscript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
}

-- Fix this later
-- nvim_lsp.sumneko_lua.setup {
--   on_attach = on_attach,
--   cmd = {'~/build/lua-language-server/main.lua', "-E", "~/build/lua-language-server/bin/linux/lua-language-server"},
--   settings = {
--     Lua = {
--       runtime = {
--         version = "LuaJIT",
--       },
--       diagnostics = {
--         globals = { 'vim' } 
--       },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file("", true)
--       },
--       telemetry = {
--         enable = false
--       }
--     }
--   }
-- }

