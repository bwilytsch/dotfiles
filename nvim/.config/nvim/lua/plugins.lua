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

    -- LSP (Maybe move this to LSPZero)
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
    use('j-hui/fidget.nvim') -- Loading bar
    use("onsails/lspkind-nvim") -- vscode-like pictograms
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
    })
    use({
        "williamboman/mason.nvim", -- package manager for LSP servers, DAP servers, linters and formatters
        "williamboman/mason-lspconfig.nvim",
    })

    -- Autocompletion
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- FZF
    use("nvim-lua/plenary.nvim")
    use { "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-telescope/telescope-live-grep-args.nvim" }
        }
    }
    use("nvim-telescope/telescope-file-browser.nvim")

    -- Tabs/Buffers
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
    })

    -- Git
    use("lewis6991/gitsigns.nvim")
    use("kdheepak/lazygit.nvim")

    -- Testing
    use("vim-test/vim-test")

    -- Utils
    use("mbbill/undotree") -- undo history
    use("folke/todo-comments.nvim") -- ToDOs for Telescope
    use {"AckslD/nvim-neoclip.lua", -- clipboard history
        requires = {
            { "kkharji/sqlite.lua" }
        }
    }
    use("numToStr/Comment.nvim") -- vscode like comment/uncomment
    use("marilari88/twoslash-queries.nvim") -- typescript inline type print
    use("folke/zen-mode.nvim") -- Focus Mode

    -- Themes
    use({
        "ellisonleao/gruvbox.nvim",
        requires = { "tjdevries/colorbuddy.nvim" },
    })
    use("olivercederborg/poimandres.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("folke/tokyonight.nvim")


    -- AI
    -- use("github/copilot.vim")
end)
