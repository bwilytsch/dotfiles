vim.opt.shortmess:append("c")
vim.opt.errorbells = false
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.hlsearch = false -- might change this in the future
vim.opt.hidden = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"

vim.opt.wrap = true

vim.opt.cursorcolumn = false
vim.opt.cursorline = true -- not sure if I like this
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5

vim.opt.list = true

vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.laststatus = 2
vim.opt.scrolloff = 5
vim.opt.showtabline = 0
vim.opt.ttimeoutlen = 50
vim.opt.ignorecase = true
-- vim.opt.wildignorecase = trurequire("bufferline")e
vim.opt.smarttab = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.relativenumber = true

-- Clipboard MacOS
vim.opt.clipboard:append({ "unnamedplus" })