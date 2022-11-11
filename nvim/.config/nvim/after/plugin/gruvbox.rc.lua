local status, g = pcall(require, "gruvbox")
if not status then
	return
end

-- local Color, colors, Group, groups, styles = require('colorbuddy').setup()
--
-- -- Gruvbox Theme
-- Color.new('black',     '#000000')
-- Color.new('white',     '#f2e5bc')
-- Color.new('red',       '#cc6666')
-- Color.new('pink',      '#fef601')
-- Color.new('green',     '#99cc99')
-- Color.new('yellow',    '#f8fe7a')
-- Color.new('blue',      '#81a2be')
-- Color.new('aqua',      '#8ec07c')
-- Color.new('cyan',      '#8abeb7')
-- Color.new('purple',    '#8e6fbd')
-- Color.new('violet',    '#b294bb')
-- Color.new('orange',    '#de935f')
-- Color.new('brown',     '#a3685a')
--
-- Color.new('seagreen',  '#698b69')
-- Color.new('turquoise', '#698b69')

g.setup({
	bold = false,
	italics = true,
	invert_selection = true,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = false,
	contrast = "soft", -- can be "soft" or "hard"
	overrides = {
		Normal = { bg = "NONE" },
		PMenu = { bg = "NONE" },
		SignColumn = { bg = "NONE" },
		GitSignsAdd = { bg = "NONE", fg = "#98971a" },
		GitSignsChange = { bg = "NONE", fg = "#d65d0e" },
		GitSignsDelete = { bg = "NONE", fg = "#cc241d" },
		CursorLine = { bg = "NONE" },
		CursorLineNr = { bg = "NONE" },
		DiagnosticSignError = { bg = "NONE", fg = "#cc241d" },
		DiagnosticSignWarn = { bg = "NONE", fg = "#fabd2f" },
		DiagnosticSignInfo = { bg = "NONE", fg = "#458588" },
		DiagnosticSignHint = { bg = "NONE", fg = "#689d6a" },
		VertSplit = { bg = "NONE", fg = "#1d2021" },
	},
})

-- vim.cmd([[colorscheme gruvbox]])
