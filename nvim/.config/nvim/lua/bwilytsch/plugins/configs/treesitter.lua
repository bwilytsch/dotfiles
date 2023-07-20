require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"css",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"rust",
		"svelte",
		"tsx",
		"typescript",
		"prisma",
    "markdown",
    "markdown_inline",
	},
	highlight = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
