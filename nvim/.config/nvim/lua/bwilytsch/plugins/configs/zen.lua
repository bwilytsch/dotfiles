require("zen-mode").setup({
	width = 0.85,
  plugins = {
    tmux = { enabled = false },
    kitty = {
      enabled = false,
      font = "+9"
    }
  },
})

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true })
