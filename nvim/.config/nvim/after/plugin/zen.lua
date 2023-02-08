local status, zen_mode = pcall(require, "zen-mode")

if not status then
	return
end

zen_mode.setup({
	width = 0.85,
})

vim.keymap.set("n", "<C-w>z", "<cmd>ZenMode<CR>", { silent = true })
