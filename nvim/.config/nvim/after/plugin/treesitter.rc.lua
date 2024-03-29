local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"typescript",
		"tsx",
		"lua",
		"json",
		"css",
		"prisma",
		"graphql",
		"astro",
        "python",
		"solidity",
        "markdown",
        "rust",
	},
	autotag = {
		enabled = true,
	},
})
