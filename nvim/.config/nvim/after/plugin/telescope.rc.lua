local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules" }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telescope-file-browser
      hijack_netrw = true
    }
  }
}

telescope.load_extension 'file_browser'
telescope.load_extension 'lazygit'
telescope.load_extension 'neoclip'


vim.keymap.set('n', '<C-n>',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

vim.keymap.set('n', '<C-p>',
  function()
    builtin.live_grep()
  end)

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {} )
vim.keymap.set('n', '<leader>nc', "<cmd>Telescope neoclip<cr>", {} )
