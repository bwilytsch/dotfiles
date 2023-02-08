local status, tokyonight = pcall(require, "tokyonight")

if not status then
	return
end

tokyonight.setup({
	-- use the night style
	style = "moon",
	transparent = true,
	-- disable italic for functions
	styles = {
		sidebars = "transsparent",
		floats = "transsparent",
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
})

vim.cmd([[colorscheme tokyonight]])
