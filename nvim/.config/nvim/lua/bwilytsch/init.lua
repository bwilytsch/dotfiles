local M = {}

local function init()
	vim.g.python3_host_prog = vim.fn.exepath("python3")
	vim.g.loaded_python_provider = 0
	vim.g.loaded_perl_provider = 0
	vim.g.loaded_ruby_provider = 0

	vim.g["test#strategy"] = "neovim"
	vim.g["test#neovim#term_position"] = "vertical"
	vim.g["test#javascript#jest#options"] = "--watch"
end

function M.setup()
    init()

    require("bwilytsch.options")
    require("bwilytsch.keymaps")
    require("bwilytsch.colorscheme")
    require("bwilytsch.plugins")
end 

return M