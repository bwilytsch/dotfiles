local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

			-- format on save
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
		end

		if client.server_capabilities.documentRangeFormattingProvider then
			vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
		end
	end,
	sources = {
		-- formatting
		null_ls.builtins.formatting.rustywind,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.prettierd,

		-- diagnostics
		-- @NOTE: Eslint_d doesn't work with certian plugins
		-- null_ls.builtins.diagnostics.eslint.with({
		-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),

		-- code actions
		-- @NOTE: Eslint_d doesn't work with certian plugins
		-- null_ls.builtins.code_actions.eslint,

		-- spelling
		-- null_ls.builtins.completion.spell,
	},
})
