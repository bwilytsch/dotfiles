local colors = {
  bg = "#282A36",
  fg = "#F8F8F2",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#FF5555",
  orange = "#FFB86C",
  yellow = "#F1FA8C",
  green = "#50fa7b",
  purple = "#BD93F9",
  cyan = "#8BE9FD",
  pink = "#FF79C6",
  bright_red = "#FF6E6E",
  bright_green = "#69FF94",
  bright_yellow = "#FFFFA5",
  bright_blue = "#D6ACFF",
  bright_magenta = "#FF92DF",
  bright_cyan = "#A4FFFF",
  bright_white = "#FFFFFF",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
  white = "#ABB2BF",
  black = "#191A21",
}

return {
  "Mofiqul/dracula.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    vim.cmd([[colorscheme dracula]])

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = "none", fg = colors.red })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg = "none", fg = colors.yellow })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg = "none", fg = colors.cyan })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingWarning", { bg = "none", fg = colors.orange })

    vim.diagnostic.config({
      show_header = false,
      float = { border = "rounded" },
    })
  end,
  config = {
    transparent_bg = true,
    italic_comment = true,
  },
}

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   init = function()
--     vim.cmd("colorscheme rose-pine")
--   end,
--   opts = {
--     variant = "auto",      -- auto, main, moon, or dawn
--     dark_variant = "main", -- main, moon, or dawn
--     dim_inactive_windows = false,
--     extend_background_behind_borders = true,
--
--     enable = {
--       terminal = true,
--       legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--       migrations = true,        -- Handle deprecated options automatically
--     },
--
--     styles = {
--       bold = true,
--       italic = true,
--       transparency = true,
--     },
--
--     groups = {
--       border = "muted",
--       link = "iris",
--       panel = "surface",
--
--       error = "love",
--       hint = "iris",
--       info = "foam",
--       note = "pine",
--       todo = "rose",
--       warn = "gold",
--
--       git_add = "foam",
--       git_change = "rose",
--       git_delete = "love",
--       git_dirty = "rose",
--       git_ignore = "muted",
--       git_merge = "iris",
--       git_rename = "pine",
--       git_stage = "iris",
--       git_text = "rose",
--       git_untracked = "subtle",
--
--       h1 = "iris",
--       h2 = "foam",
--       h3 = "rose",
--       h4 = "gold",
--       h5 = "pine",
--       h6 = "foam",
--     },
--   }
-- }
