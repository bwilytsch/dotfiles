local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("Format", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		-- if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
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

null_ls.setup({
	debug = true,
	on_attach = on_attach,
	sources = {
		-- formatting
		null_ls.builtins.formatting.rustywind,
		null_ls.builtins.formatting.stylua,
		-- prettierd is not supported
		null_ls.builtins.formatting.prettier.with({ filetypes = { "tsx", "typescript", "typescriptreact" } }),
		-- null_ls.builtins.formatting.eslint,

		-- diagnostics
		-- @NOTE: Eslint_d doesn't work with certian plugins
		-- null_ls.builtins.diagnostics.eslint.with({
		-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),

		-- code actions
		-- @NOTE: Eslint_d doesn't work with certian plugins
		null_ls.builtins.code_actions.eslint,

		-- spelling
		-- null_ls.builtins.completion.spell,
	},
})
