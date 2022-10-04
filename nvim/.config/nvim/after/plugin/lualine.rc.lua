local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		-- theme = "catppuccin",
		theme = "gruvbox",
		-- theme = "poimandres",
		-- component_separators = { left = '', right = ''},
		component_separators = { left = "->", right = "<-" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		-- Potentially change this in the future
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{
				"filename",
				path = 0,
				symbols = {
					modified = "[+]",
					readonly = "[-]",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
			},
			"filesize",
		},
		lualine_x = {
			{
				"diagnotics",
				sources = { "nvim_diagnostics" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = "E",
					warn = "W",
					info = "I",
					hint = "H",
				},
				-- diagnostics_color
				colored = true,
				update_in_insert = false,
				always_visible = false, -- show diagnostics even if there are none
			},
			{
				"filetype",
				colored = false,
				icon_only = false,
			},
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {
		"fugitive",
	},
})
