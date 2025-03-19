vim.g.have_nerd_font = false
-- options

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250

vim.opt.relativenumber = true
vim.opt.timeoutlen = 250 -- This is responsible for the keyboard shortcuts

vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.shortmess:append 'c'
vim.opt.errorbells = false
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.hlsearch = false -- might change this in the future
vim.opt.hidden = true
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.signcolumn = 'yes'
vim.opt.wrap = true
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 0 -- Dictates the transparency of floating dialogs
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.laststatus = 3 -- Bumped to 3 for `avante` plugin
vim.opt.showtabline = 0
vim.opt.ignorecase = true
-- vim.opt.smarttab = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
