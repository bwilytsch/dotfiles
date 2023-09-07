require("zen-mode").setup({
	width = 0.85,
  options = {
    number = true
  },
  plugins = {
    tmux = { enabled = false },
    kitty = {
      enabled = true,
      font = "+4",
    }
  },
})

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true })
