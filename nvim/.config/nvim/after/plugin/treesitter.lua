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
		"markdown",
		"prisma",
	},
	highlight = { enable = true },
})
