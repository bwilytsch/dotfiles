require("zen-mode").setup({
	width = 0.85,
})

vim.keymap.set("n", "<C-w>z", "<cmd>ZenMode<CR>", { silent = true })