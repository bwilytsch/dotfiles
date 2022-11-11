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

-- This is called twice... in null.ls.rc as well
local on_attach = function(client, bufnr)
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(client)
						return client.name ~= "tsserver"
					end,
				})
			end,
		})
	end
end

-- TypeScript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.eslint.setup({
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
    flags = { debounce_text_changes = 500 },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      if client.server_capabilities.documentFormattingProvider then
        local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function()
            vim.lsp.buf.format({ async = true })
          end,
          group = au_lsp,
        })
      end
    end,
})

nvim_lsp.tailwindcss.setup({
	filetypes = {
		"typescriptreact",
		"typescript.tsx",
		"tsx",
		"javascript.jsx",
		"javascriptreact",
		-- "typescript",
		-- "javascript",
	},
})

nvim_lsp.html.setup({})
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
