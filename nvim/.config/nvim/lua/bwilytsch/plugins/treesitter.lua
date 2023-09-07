return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	priority = 1000,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", "windwp/nvim-ts-autotag" },
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },
			-- ensure these language parsers are installed
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
				"markdown_inline",
				"astro",
				"cpp",
				"go",
				"dockerfile",
				"glsl",
				"gitignore",
				"toml",
				"yaml",
			},
			-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			-- auto install above language parsers
			auto_install = true,
		})
	end,
}
