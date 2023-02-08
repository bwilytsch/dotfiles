local status, packer = pcall(require, "packer")

if not status then
	return
end

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Core
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("github/copilot.vim")
	use("janko/vim-test")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- Debugger
			-- "mfussenegger/nvim-dap",
			-- Linter/Formatter
			"creativenull/diagnosticls-nvim",
			-- Tool Installer
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"jayp0521/mason-nvim-dap.nvim",
			"simrat39/rust-tools.nvim",
			"glepnir/lspsaga.nvim",
			"j-hui/fidget.nvim", -- Loading bar
		},
		config = function()
			require("lspsaga").setup({ ui = { border_style = "rounded", winblend = 0 } })
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	})

	-- Autocompletion and Snippets
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			-- Cmdline completions
			"hrsh7th/cmp-cmdline",
			-- Path completions
			"hrsh7th/cmp-path",
			-- Buffer completions
			"hrsh7th/cmp-buffer",
			-- LSP completions
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind-nvim",
			-- vnsip completions
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
		},
	})

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")

	-- Utils
	use("folke/which-key.nvim")
	use("folke/zen-mode.nvim") -- Focus Mode

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { {
			"nvim-lua/plenary.nvim",
		} },
	})

	-- Theme
	use("folke/tokyonight.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})

	-- Webdev
	use("princejoogie/tailwind-highlight.nvim")
end)
