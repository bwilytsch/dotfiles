local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'ellisonleao/gruvbox.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' 
  use 'kyazdani42/nvim-web-devicons'
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp' -- completion
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Tabs/Buffers
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*"
  } 

  use 'glepnir/lspsaga.nvim' -- LSP Saga
  use 'lewis6991/gitsigns.nvim' -- Gitsigns
  use 'kdheepak/lazygit.nvim'

  use 'AckslD/nvim-neoclip.lua'
  use 'kkharji/sqlite.lua'

  use 'b3nj5m1n/kommentary' -- vscode like comment/uncomment

  use {
    'williamboman/mason.nvim', -- packag emanager for LSP servers, DAP servers, linters and formatters
    'williamboman/mason-lspconfig.nvim',
  }

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } -- DAP
  use 'folke/zen-mode.nvim'

end)
