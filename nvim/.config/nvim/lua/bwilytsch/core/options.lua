-- Neovim options (cleaned up duplicates)

vim.g.have_nerd_font = false

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- UI
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.laststatus = 3 -- Global statusline for avante
vim.opt.showtabline = 0
vim.opt.scrolloff = 10

-- Clipboard (scheduled to avoid startup delay)
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Indentation
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.showmatch = true

-- Files
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undodir'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true

-- Timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 250

-- Misc
vim.opt.shortmess:append 'c'
vim.opt.errorbells = false
vim.opt.wrap = true
vim.opt.list = true
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
