local status, telescope = pcall(require, "telescope")

if not status then
	return
end

local telescope_actions = require("telescope.actions")
local telescope_builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.load_extension("lazygit")
telescope.load_extension("file_browser")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"%.git/",
			"node_modules/",
			"dist/",
			"test/",
			"build/",
			"coverage/",
			"__pycache__/",
			"%.o",
			"client/graphql/",
			"src-tauri/target/",
		},
		mappings = {
			i = {
				["<C-k>"] = telescope_actions.move_selection_previous,
				["<C-j>"] = telescope_actions.move_selection_next,
			},
		},
		extensions = {
			file_browser = {
				hijack_netrw = true,
				hidden = true,
			},
		},
	},
})

vim.keymap.set("n", "<leader>gp", function()
	telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set("n", "<C-n>", function()
	telescope_builtin.find_files({ hidden = true })
end, { desc = "Find files" })

vim.keymap.set("n", "<C-t>", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h", -- use path of current selected buffer
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", "<C-h>", function()
	telescope_builtin.oldfiles()
end)

vim.keymap.set("n", "<Leader>c", function()
	telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find files within vim config" })

vim.keymap.set("n", "<Leader>fh", function()
	telescope_builtin.help_tags()
end, { desc = "Help tags" })

vim.keymap.set("n", "<C-p>", function()
	telescope_builtin.buffers()
end, { desc = "Show buffers" })

vim.keymap.set("n", "<Leader>gs", function()
	telescope_builtin.git_status()
end, { desc = "Git status" })

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", {})
