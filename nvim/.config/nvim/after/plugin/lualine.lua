local status, lualine = pcall(require, "lualine")

if not status then
  return
end

lualine.setup({
  options = {
    theme = "tokyonight",
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    seciton_separators = { left = "", right = "" },
  },
  always_divide_middle = true,
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diagnotics" },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
})
