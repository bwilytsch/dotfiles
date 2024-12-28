return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		local neotest = require("neotest")

		-- Keybindings
		vim.keymap.set("n", "<leader>tn", function()
			neotest.run.run()
		end, { noremap = true, silent = true, desc = "Run [n]earest [t]est" })

		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { noremap = true, silent = true, desc = "Run the current [t]est [f]ile" })

		vim.keymap.set("n", "<leader>ts", function()
			neotest.run.stop()
		end, { noremap = true, silent = true, desc = "[S]top the nearest [t]est" })

		vim.keymap.set("n", "<leader>tts", function()
			neotest.summary.toggle()
		end, { noremap = true, silent = true, desc = "[T]oggle test summary" })

		-- Setup vitest
		neotest.setup({
			adapters = {
				require("neotest-vitest")({
					filter_dir = function(name, rel_path, root)
						return name ~= "node_modules"
					end,
				}),
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
