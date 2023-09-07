return {
  {
		"Mofiqul/dracula.nvim",
		priority = 1000,
		lazy = false,
    opts = {
      transparent_bg = true,
      italic_comment = true,
    },
		config = function()
			vim.cmd([[colorscheme dracula]])
		end
	}
}
