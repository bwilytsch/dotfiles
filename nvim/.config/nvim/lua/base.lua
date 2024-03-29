vim.cmd("autocmd!")
vim.g.mapleader = " "

vim.noswapfile = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "no"

-- Adding this due to a delayed cursor movement issue
vim.opt.timeoutlen = 100

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = false -- might change this in the future
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10 -- scroll offset
vim.opt.shell = "zsh"
vim.opt.backupskip = "/tmp/*,/private/tmp/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" }) -- Finding files - Traverse subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisk in block comments
vim.opt.formatoptions:append({ "r" })
