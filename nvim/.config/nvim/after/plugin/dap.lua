local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

-- @TODO: Redo this with: https://alpha2phi.medium.com/neovim-for-beginners-javascript-typescript-debugging-bd0fc8e16657
dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/dap-debugger/vscode-js-debug/out/src/debugServerMain.js", "45635" },
}
dap.configurations.typescript = {
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		debugServer = 45635,
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.typescriptreact = {
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		debugServer = 45635,
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

vim.keymap.set("n", "dc", [[<Cmd>lua require'dap'.continue()<CR>]])

vim.keymap.set("n", "<F10>", [[<Cmd>lua require'dap'.step_over()<CR>]])
vim.keymap.set("n", "<F11>", [[<Cmd>lua require'dap'.step_into()<CR>]])
vim.keymap.set("n", "<F12>", [[<Cmd>lua require'dap'.step_out()<CR>]])
vim.keymap.set("n", "<Leader>b", [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]])
vim.keymap.set("n", "<Leader>B", [[<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]])
vim.keymap.set(
	"n",
	"<Leader>lp",
	[[<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]]
)
vim.keymap.set("n", "<leader>dr", [[<Cmd>lua require'dap'.repl.open()<CR>]])
vim.keymap.set("n", "<leader>dl", [[<Cmd>lua require'dap'.run_last()<CR>]])
