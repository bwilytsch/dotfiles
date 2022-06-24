lua << END

require('nvim-treesitter.configs').setup ({
  ensure_installed = {
    "typescript",
    "tsx",
    "dockerfile",
    "graphql",
    "glsl",
    "html",
    "css",
    "yaml",
    "lua",
    "javascript",
    "jsdoc",
    "json",
    "vim",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enabled = true,
    filetype = { "typescriptreact", "javascriptreact", "html" }
  }
})

END
