local status, nvim_lsp = pcall(require, "lspconfig")
local status_fidget, fidget = pcall(require, "fidget")

if not status then
	return
end

if status_fidget then
    fidget.setup({
        text = {
            spinner = "dots_ellipsis",
            done = "  ",
            commenced = "  ",
            completed = "  "
        },
        align = {
            bottom = true,
            right = true,
        },
        timer = {
            fidget_decay = 100,
            task_decay = 100,
        },
        window = {
            -- relative = "win",
            blend = 0,
            -- border = "none"
        }
    })
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

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mapping is done via LspSaga

  if client.name ~= "tsserver" then
    require("twoslash-queries").attach(client, bufnr)
  end
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
nvim_lsp.html.setup({
    on_attach = on_attach
})

nvim_lsp.prismals.setup({
    on_attach = on_attach
})

nvim_lsp.solidity_ls.setup({
    on_attach = on_attach
})

nvim_lsp.graphql.setup({
    on_attach = on_attach
})

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
})

nvim_lsp.taplo.setup({
    on_attach = on_attach
})
