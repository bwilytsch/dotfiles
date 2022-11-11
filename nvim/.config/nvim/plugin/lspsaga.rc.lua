local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
	server_filetype_map = {},
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "rounded",
	saga_winblend = 0,
	code_action_icon = "",
	-- finder do lsp request timeout
	-- if your project big enough or your server very slow
	-- you may need to increase this value
	finder_request_timeout = 4000,
	diagnostic_header = { "T", "T", "T", "T" },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Look Up
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<cr>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga signature_help<cr>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<cr>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<cr>", opts)

-- Actions
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", { silent = true })
