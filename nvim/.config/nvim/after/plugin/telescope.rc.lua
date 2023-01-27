local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
	},
	extensions = {
		file_browser = {
			-- theme = 'ivy',
			-- layout_config = {
			--   width = 100
			-- },
			-- disables netrw add use telescope-file-browser
			hijack_netrw = true,
			hidden = true,
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("lazygit")
telescope.load_extension("neoclip")
telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<C-n>", function()
	builtin.git_files({
		no_ignore = false,
		hidden = true,
	})
end)

-- vim.keymap.set("n", "<C-p>", function()
-- 	builtin.live_grep()
-- end)

vim.keymap.set("n", "<C-p>", function()
    telescope.extensions.live_grep_args.live_grep_args()
end)

vim.keymap.set("n", "<C-h>", function()
	builtin.oldfiles()
end)

vim.keymap.set("n", "<leader>m", function()
	builtin.marks()
end)

-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { noremap = true })
-- vim.keymap.set("n", "<leader>nc", "<cmd>:lua require('telescope').extensions.neoclip.default()<cr>", {})
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", {})

vim.keymap.set("n", "<C-t>", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h", -- use path of current selected buffer
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		-- previewer = false,
		initial_mode = "normal",
		-- layout_config = { height = 24 }
	})
end)
