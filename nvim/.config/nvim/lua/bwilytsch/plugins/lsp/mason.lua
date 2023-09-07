return {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "jayp0521/mason-nvim-dap.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "eslint_d",
          "prettier",
          "stylua",
          "codelldb",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "cssls",
          "diagnosticls",
          "dockerls",
          "html",
          "jsonls",
          "pylsp",
          "rust_analyzer",
          "lua_ls",
          "tailwindcss",
          "tsserver",
          "yamlls",
          "clangd",
          "gopls",
        },
        automatic_installation = true,
      })
    end
}
