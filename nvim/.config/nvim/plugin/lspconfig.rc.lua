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

-- Formatting should be done via eslint OR prettier
local on_attach = function(client, bufnr)
	-- format on save
	-- if client.server_capabilities.documentFormattingProvider then
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- 		group = vim.api.nvim_create_augroup("Format", { clear = true }),
	-- 		buffer = bufnr,
	-- 		callback = function()
	-- 			vim.lsp.buf.format({
	-- 				bufnr = bufnr,
	-- 				filter = function(client)
	-- 					return client.name ~= "tsserver"
	-- 				end,
	-- 			})
	-- 		end,
	-- 	})
	-- end
    -- Not sure if I want to do this here, but this is currently only used by my tsserver
    require("twoslash-queries").attach(client, bufnr)
end

-- TypeScript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.tailwindcss.setup({
	filetypes = {
		"typescriptreact",
		"typescript.tsx",
		"tsx",
		"javascriptreact",
		"javascript.jsx",
        "jsx"
	},
})

nvim_lsp.eslint.setup({
    on_attach = function()
        vim.api.nvim_create_autocmd(
            'BufWritePre',
            { command = 'EslintFixAll', pattern = "*.tsx,*.ts,*.jsx,*.js"}
        )
    end
})

nvim_lsp.sumneko_lua.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' } -- mute 'vim' is undefined global warning
            }
        }
    }
})
nvim_lsp.html.setup({})
nvim_lsp.prismals.setup({})
nvim_lsp.solidity_ls.setup({})
nvim_lsp.graphql.setup({})
nvim_lsp.rust_analyzer.setup({})
nvim_lsp.taplo.setup({})
