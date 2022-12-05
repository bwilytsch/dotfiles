local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.init({
	max_jobs = 10,
})

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Themes
	use({
		"ellisonleao/gruvbox.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use("olivercederborg/poimandres.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("folke/tokyonight.nvim")

	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("neovim/nvim-lspconfig") -- LSP
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("jose-elias-alvarez/typescript.nvim")
	use("hrsh7th/nvim-cmp") -- completion
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("nvim-lua/plenary.nvim")
	use{"nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-telescope/telescope-live-grep-args.nvim"}
        }
    }

	use("nvim-telescope/telescope-file-browser.nvim")
	use("folke/todo-comments.nvim") -- ToDOs for Telescope

	-- Tabs/Buffers
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
	})

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	}) -- LSP Saga
	use("lewis6991/gitsigns.nvim") -- Gitsigns
	use("kdheepak/lazygit.nvim")

	use("AckslD/nvim-neoclip.lua")
	use("kkharji/sqlite.lua")

	use("numToStr/Comment.nvim") -- vscode like comment/uncomment

	use({
		"williamboman/mason.nvim", -- packag emanager for LSP servers, DAP servers, linters and formatters
		"williamboman/mason-lspconfig.nvim",
	})

	use("folke/zen-mode.nvim")
end)
