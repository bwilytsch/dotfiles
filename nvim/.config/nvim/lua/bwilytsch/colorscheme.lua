local status, tokyonight = pcall(require, "tokyonight")

if not status then
	return
end

-- tokyonight.setup({
-- 	-- use the night style
-- 	style = "moon",
-- 	transparent = true,
-- 	-- disable italic for functions
-- 	styles = {
-- 		sidebars = "transsparent",
-- 		floats = "transsparent",
-- 	},
-- 	sidebars = { "qf", "vista_kind", "terminal", "packer" },
-- 	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- 	on_colors = function(colors)
-- 		colors.hint = colors.orange
-- 		colors.error = "#ff0000"
-- 	end,
-- })

-- vim.cmd([[colorscheme tokyonight]])

tokyonight.setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "transparent"
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer", "help" },
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
})
-- Lua
vim.cmd([[colorscheme tokyonight]])
