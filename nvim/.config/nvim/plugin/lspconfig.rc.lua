local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local protocol = require("vim.lsp.protocol")

-- local on_attach = function(client, bufnr)
--   -- disable auto-formatting
--   if client.server_capabilities.documentFormattingProvider then
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--   end
-- end
--
-- nvim_lsp.tsserver.setup({
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" },
-- })

nvim_lsp.tailwindcss.setup({
	filetypes = {
		"typescriptreact",
		"typescript.tsx",
		"typescript",
		"tsx",
		"javascript",
		"javascript.jsx",
		"javascriptreact",
	},
})

nvim_lsp.eslint.setup({})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup({
	-- capabilities = capabilities,
})

nvim_lsp.prismals.setup({})
nvim_lsp.solidity_ls.setup({})
nvim_lsp.graphql.setup({})

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
