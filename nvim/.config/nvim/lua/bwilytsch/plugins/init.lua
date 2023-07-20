local user_plugins = {
  -- Core
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<Leader>g", "<Cmd>Git<CR>", { desc = "Git status" }) -- check if this is needed?
    end,
  },
  "tpope/vim-surround",
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  {
    "janko/vim-test",
    config = function()
      vim.keymap.set("n", "<leader>tt", "<cmd>TestFile<cr>", { silent = true })
    end
  },
  "jiangmiao/auto-pairs",
  {
    "github/copilot.vim",
    config = function()
      require("bwilytsch.plugins.configs.copilot")
    end,
  },
  "kevinhwang91/nvim-bqf",
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<Leader>u", "<Cmd>UndotreeToggle<CR>", { desc = "Open undo tree" })
    end,
  },

  -- Telescope
  {
    "nvim-lua/telescope.nvim",
    branch = "0.1.x",
    requires = {
      {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "folke/todo-comments.nvim",
      },
    },
    config = function()
      require("bwilytsch.plugins.configs.telescope")
    end,
  },

  -- Whichkey
  {
    "folke/which-key.nvim",
    tag = "v1.4.3",
    config = function()
      require("bwilytsch.plugins.configs.which-key")
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    commit = "0011c435282f043a018e23393cae06ed926c3f4a",
    requires = {
      -- Debuggers
      { "mfussenegger/nvim-dap",                     tag = "0.6.0" },
      -- Linter/Formatter
      "creativenull/diagnosticls-configs-nvim",
      -- Tool installer
      { "williamboman/mason.nvim",                   tag = "v1.5.1" },
      { "williamboman/mason-lspconfig.nvim",         tag = "v1.8.0" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "49e3efe743d846d80da5a4757d4f7e563a96cb84" },
      { "jayp0521/mason-nvim-dap.nvim",              tag = "v2.1.1" },
      -- Rust specific
      { "simrat39/rust-tools.nvim",                  commit = "71d2cf67b5ed120a0e31b2c8adb210dd2834242f" },
      -- lua specific
      { "folke/neodev.nvim",                         tag = "v2.5.2" },
      "glepnir/lspsaga.nvim",
      -- loading bar
      { "j-hui/fidget.nvim", tag = "legacy" }
    },
    config = function()
      require("mason").setup()

      -- LSP
      require("bwilytsch.plugins.configs.lspconfig")

      -- Debugger
      require("bwilytsch.plugins.configs.dap")
    end,
  },

  -- Autocompletion and Snippets
  {
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
    config = function()
      require("bwilytsch.plugins.configs.cmp")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      require("bwilytsch.plugins.configs.treesitter")
    end,
  },

  -- -- Autoclose and autorename html tag
  -- {
  --     "windwp/nvim-ts-autotag",
  --     config = function()
  --         require("nvim-ts-autotag").setup({})
  --     end
  -- },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("bwilytsch.plugins.configs.gitsigns")
    end
  },
  "kdheepak/lazygit.nvim",

  -- Focus Mode
  {
    "folke/zen-mode.nvim",
    config = function()
      require("bwilytsch.plugins.configs.zen")
    end
  },

  -- Theme/Syntax
  { "folke/tokyonight.nvim",                as = "tokyonight" },
  {
    "nvim-lualine/lualine.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bwilytsch.plugins.configs.lualine")
    end,
  },
  { "princejoogie/tailwind-highlight.nvim", commit = "cfd53d0f6318e8eaada03e10c7f2e4e57ec430c5" },
}

-- Plugin Setup
-- ============
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").init({
  compile_path = string.format("%s/site/plugin/packer_compiled.lua", vim.fn.stdpath("data")),
  display = {
    prompt_border = "rounded",
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- My plugins here
  for _, user_plugin in pairs(user_plugins) do
    use(user_plugin)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
